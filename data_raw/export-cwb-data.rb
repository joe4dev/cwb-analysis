# List of BenchmarkDefinition IDs to export:
export_ids = [*(20..23),26,29,33,*(38..42),*(52..57),59]

class Exporter
  # Exports all metrics from all benchmarks into a single flat CSV
  def self.flat_csv
    self.to_csv(self.all_benchmark_definitions)
  end

  # Exports all metrics from the benchmark IDs provided in `bdef_ids` into a CSV
  def self.csv(bdef_ids)
    bdefs = bdef_ids.map { |bdef_id| BenchmarkDefinition.find(bdef_id) }
    self.to_csv(bdefs)
  end

  def self.all_benchmark_definitions
    BenchmarkDefinition.order(id: :desc).reverse_order
  end

  def self.to_csv(bdefs)
    CSV.generate(col_sep: ';') do |csv|
      csv << ['source', 'benchmark_start_time', 'execution_status', 'provider_name', 'provider_vm_id', 'vm_role', 'metric_name', 'unit', 'iteration', 'timestamp', 'value']
      bdefs.each do |bdef|
        self.append_to(csv, bdef)
      end
    end
  end

  def self.to_bm_csv(bdef)
    CSV.generate(col_sep: ';') do |csv|
      csv << ['source', 'benchmark_start_time', 'execution_status', 'provider_name', 'provider_vm_id', 'vm_role', 'metric_name', 'unit', 'iteration', 'timestamp', 'value']
      self.append_to(csv, bdef)
    end
  end

  def self.append_to(csv, bdef)
    bdef.benchmark_executions.each do |exe|
      exe.virtual_machine_instances.each do |vm|
        bdef.metric_definitions.each do |mdef|
          mdef.nominal_metric_observations.where(virtual_machine_instance: vm).order(:time).each_with_index do |observation, index|
            iteration = (index + 1)
            csv << [
              bdef.name,
              exe.benchmark_start_time.to_i,
              exe.status,
              vm.provider_name,
              vm.provider_instance_id,
              vm.role,
              mdef.name,
              mdef.unit,
              iteration,
              observation.time,
              (observation.value.strip rescue (STDERR.puts "[MISSING VALUE] #{bdef.name}-#{mdef.name}-#{vm.provider_instance_id}-#{iteration}"; ''))
             ]
          end
        end
      end
    end
  end
end

### START SCRIPT ###
puts Exporter.csv(export_ids)
STDOUT.flush
