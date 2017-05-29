# wordpress-bench/s1-response_time

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1239.534 +/- 0.000
absolute_error: 1187.234 +/- 356.258
relative_error: 359.11% +/- 218.82%
relative_error_lenient: 70.63% +/- 17.60%
relative_error_strict: 359.11% +/- 218.82%
normalized_absolute_error: 2.778
root_relative_squared_error: 2.547
squared_error: 1536444.534 +/- 774177.941
correlation: 0.804
squared_correlation: 0.646
prediction_average: 606.531 +/- 486.621
spearman_rho: 0.935
kendall_tau: 0.812

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1635.971 +/- 0.000
absolute_error: 1612.597 +/- 275.561
relative_error: 615.97% +/- 606.63%
relative_error_lenient: 75.19% +/- 17.47%
relative_error_strict: 615.97% +/- 606.63%
normalized_absolute_error: 3.773
root_relative_squared_error: 3.362
squared_error: 2676402.634 +/- 873962.678
correlation: 0.825
squared_correlation: 0.680
prediction_average: 606.531 +/- 486.621
spearman_rho: 0.917
kendall_tau: 0.801

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 89.284 +/- 0.000
absolute_error: 69.989 +/- 55.437
relative_error: 12.46% +/- 7.14%
relative_error_lenient: 11.91% +/- 7.04%
relative_error_strict: 14.28% +/- 9.63%
normalized_absolute_error: 0.164
root_relative_squared_error: 0.183
squared_error: 7971.712 +/- 11634.369
correlation: 0.996
squared_correlation: 0.992
prediction_average: 606.531 +/- 486.621
spearman_rho: 0.966
kendall_tau: 0.834

## stressng/network-icmp-flood-bogo-ops

{}

# wordpress-bench/s2-response_time

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1507.439 +/- 0.000
absolute_error: 1440.872 +/- 443.012
relative_error: 319.48% +/- 185.13%
relative_error_lenient: 69.01% +/- 17.59%
relative_error_strict: 319.48% +/- 185.13%
normalized_absolute_error: 2.689
root_relative_squared_error: 2.458
squared_error: 2272370.914 +/- 1181130.233
correlation: 0.804
squared_correlation: 0.647
prediction_average: 788.107 +/- 613.355
spearman_rho: 0.927
kendall_tau: 0.792

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1999.636 +/- 0.000
absolute_error: 1969.802 +/- 344.131
relative_error: 545.92% +/- 515.18%
relative_error_lenient: 73.98% +/- 17.61%
relative_error_strict: 545.92% +/- 515.18%
normalized_absolute_error: 3.676
root_relative_squared_error: 3.260
squared_error: 3998544.409 +/- 1322101.867
correlation: 0.829
squared_correlation: 0.687
prediction_average: 788.107 +/- 613.355
spearman_rho: 0.917
kendall_tau: 0.801

## sysbench/cpu-multi-thread-duration

PerformanceVector:
root_mean_squared_error: 105.563 +/- 0.000
absolute_error: 97.257 +/- 41.043
relative_error: 17.52% +/- 8.69%
relative_error_lenient: 17.09% +/- 8.90%
relative_error_strict: 22.12% +/- 14.08%
normalized_absolute_error: 0.182
root_relative_squared_error: 0.172
squared_error: 11143.453 +/- 7321.545
correlation: 0.995
squared_correlation: 0.989
prediction_average: 788.107 +/- 613.355
spearman_rho: 0.974
kendall_tau: 0.862

## stressng/network-icmp-flood-bogo-ops

{}

# wordpress-bench/s3-response_time

## fio/4k-seq-write-bandwidth + fio/8k-rand-read-latency +sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 596.460 +/- 0.000
absolute_error: 466.404 +/- 371.796
relative_error: 30.15% +/- 17.94%
relative_error_lenient: 25.76% +/- 13.57%
relative_error_strict: 39.58% +/- 27.18%
normalized_absolute_error: 0.839
root_relative_squared_error: 0.878
squared_error: 355764.924 +/- 586940.229
correlation: 0.565
squared_correlation: 0.319
prediction_average: 1537.738 +/- 679.267
spearman_rho: 0.565
kendall_tau: 0.393

```
lm(formula = as.formula(paste(label, micro, sep = " ~ ")), data = train)

Residuals:
       1        2        3        4        5        6 
   6.026    1.589   -7.767 -546.392  608.450  -61.906 

Coefficients:
                                   Estimate Std. Error t value Pr(>|t|)
(Intercept)                        6274.113   7735.839   0.811    0.503
sysbench.cpu.multi.thread.duration   16.724      7.929   2.109    0.169
fio.8k.rand.read.latency             25.991     24.032   1.082    0.393
fio.4k.seq.write.bandwidth           -1.273      1.368  -0.931    0.450

Residual standard error: 580 on 2 degrees of freedom
Multiple R-squared:  0.9062,    Adjusted R-squared:  0.7656 
F-statistic: 6.443 on 3 and 2 DF,  p-value: 0.1373
```

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1250.585 +/- 0.000
absolute_error: 1129.070 +/- 537.741
relative_error: 100.30% +/- 79.07%
relative_error_lenient: 43.02% +/- 19.02%
relative_error_strict: 100.34% +/- 79.02%
normalized_absolute_error: 2.031
root_relative_squared_error: 1.841
squared_error: 1563964.052 +/- 1284577.601
correlation: 0.522
squared_correlation: 0.273
prediction_average: 1537.738 +/- 679.267
spearman_rho: 0.583
kendall_tau: 0.427

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 1537.104 +/- 0.000
absolute_error: 1434.518 +/- 552.128
relative_error: 127.12% +/- 89.80%
relative_error_lenient: 49.09% +/- 18.89%
relative_error_strict: 127.13% +/- 89.79%
normalized_absolute_error: 2.580
root_relative_squared_error: 2.263
squared_error: 2362687.959 +/- 1531815.779
correlation: 0.530
squared_correlation: 0.281
prediction_average: 1537.738 +/- 679.267
spearman_rho: 0.578
kendall_tau: 0.451

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 565.704 +/- 0.000
absolute_error: 483.689 +/- 293.369
relative_error: 40.77% +/- 34.89%
relative_error_lenient: 26.01% +/- 15.53%
relative_error_strict: 42.19% +/- 34.24%
normalized_absolute_error: 0.870
root_relative_squared_error: 0.833
squared_error: 320020.679 +/- 318099.154
correlation: 0.652
squared_correlation: 0.425
prediction_average: 1537.738 +/- 679.267
spearman_rho: 0.584
kendall_tau: 0.398

```
lm(formula = as.formula(paste(label, micro, sep = " ~ ")), data = train)

Residuals:
     1      2      3      4      5      6 
 583.0   84.7 -673.0 -486.2  639.3 -147.7 

Coefficients:
                                   Estimate Std. Error t value Pr(>|t|)  
(Intercept)                        1191.621    373.047   3.194   0.0331 *
sysbench.cpu.multi.thread.duration   21.524      5.456   3.945   0.0169 *
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 605.6 on 4 degrees of freedom
Multiple R-squared:  0.7955,    Adjusted R-squared:  0.7444 
F-statistic: 15.56 on 1 and 4 DF,  p-value: 0.01689
```

## stressng/network-icmp-flood-bogo-ops

{}

# md-sim-duration

## fio/8k-rand-read-iops + sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 16.415 +/- 0.000
absolute_error: 10.644 +/- 12.496
relative_error: 3.91% +/- 2.80%
relative_error_lenient: 3.82% +/- 2.70%
relative_error_strict: 4.05% +/- 2.90%
normalized_absolute_error: 0.078
root_relative_squared_error: 0.105
squared_error: 269.454 +/- 468.405
correlation: 0.999
squared_correlation: 0.997
prediction_average: 237.137 +/- 155.709
spearman_rho: 0.974
kendall_tau: 0.871


```
lm(formula = as.formula(paste(label, micro, sep = " ~ ")), data = train)

Residuals:
      1       2       3       4       5       6 
-2.4788  2.0009  0.4891  1.8855 -0.7458 -1.1509 

Coefficients:
                                      Estimate  Std. Error t value     Pr(>|t|)    
(Intercept)                        -25.6473999  10.3230310  -2.484       0.0889 .  
sysbench.cpu.multi.thread.duration   8.7849709   0.0299605 293.219 0.0000000875 ***
fio.8k.rand.read.iops                0.0017967   0.0007548   2.380       0.0976 .  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 2.297 on 3 degrees of freedom
Multiple R-squared:      1, Adjusted R-squared:      1 
F-statistic: 8.907e+04 on 2 and 3 DF,  p-value: 0.00000006911
```

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 366.446 +/- 0.000
absolute_error: 350.318 +/- 107.517
relative_error: 206.09% +/- 95.47%
relative_error_lenient: 62.56% +/- 15.55%
relative_error_strict: 206.09% +/- 95.47%
normalized_absolute_error: 2.554
root_relative_squared_error: 2.353
squared_error: 134282.338 +/- 69248.907
correlation: 0.810
squared_correlation: 0.656
prediction_average: 237.137 +/- 155.709
spearman_rho: 0.953
kendall_tau: 0.855

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 488.106 +/- 0.000
absolute_error: 480.042 +/- 88.361
relative_error: 316.65% +/- 184.43%
relative_error_lenient: 69.12% +/- 16.62%
relative_error_strict: 316.65% +/- 184.43%
normalized_absolute_error: 3.499
root_relative_squared_error: 3.135
squared_error: 238247.831 +/- 83702.056
correlation: 0.826
squared_correlation: 0.683
prediction_average: 237.137 +/- 155.709
spearman_rho: 0.917
kendall_tau: 0.801

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 17.010 +/- 0.000
absolute_error: 14.483 +/- 8.921
relative_error: 8.22% +/- 4.65%
relative_error_lenient: 8.16% +/- 4.68%
relative_error_strict: 9.16% +/- 5.42%
normalized_absolute_error: 0.106
root_relative_squared_error: 0.109
squared_error: 289.336 +/- 265.107
correlation: 0.999
squared_correlation: 0.998
prediction_average: 237.137 +/- 155.709
spearman_rho: 0.980
kendall_tau: 0.894

## stressng/network-icmp-flood-bogo-ops

{}

# wordpress-bench/s1-throughput

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.339 +/- 0.000
absolute_error: 0.275 +/- 0.198
relative_error: 26.99% +/- 30.47%
relative_error_lenient: 17.42% +/- 16.41%
relative_error_strict: 27.11% +/- 30.39%
normalized_absolute_error: 0.326
root_relative_squared_error: 0.388
squared_error: 0.115 +/- 0.114
correlation: 0.957
squared_correlation: 0.915
prediction_average: 1.750 +/- 0.875
spearman_rho: 0.811
kendall_tau: 0.617

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.747 +/- 0.000
absolute_error: 0.675 +/- 0.322
relative_error: 42.68% +/- 13.05%
relative_error_lenient: 36.42% +/- 13.37%
relative_error_strict: 64.78% +/- 36.39%
normalized_absolute_error: 0.801
root_relative_squared_error: 0.854
squared_error: 0.559 +/- 0.500
correlation: 0.973
squared_correlation: 0.947
prediction_average: 1.750 +/- 0.875
spearman_rho: 0.858
kendall_tau: 0.717

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.926 +/- 0.000
absolute_error: 0.895 +/- 0.238
relative_error: 79.38% +/- 56.93%
relative_error_lenient: 38.45% +/- 18.40%
relative_error_strict: 79.38% +/- 56.93%
normalized_absolute_error: 1.062
root_relative_squared_error: 1.058
squared_error: 0.858 +/- 0.412
correlation: 0.982
squared_correlation: 0.965
prediction_average: 1.750 +/- 0.875
spearman_rho: 0.914
kendall_tau: 0.733

## stressng/network-icmp-flood-bogo-ops

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.569 +/- 0.000
absolute_error: 0.313 +/- 0.475
relative_error: 23.04% +/- 27.50%
relative_error_lenient: 19.43% +/- 23.16%
relative_error_strict: 42.78% +/- 67.44%
normalized_absolute_error: 0.371
root_relative_squared_error: 0.650
squared_error: 0.324 +/- 0.695
correlation: 0.815
squared_correlation: 0.664
prediction_average: 1.750 +/- 0.875
spearman_rho: 0.843
kendall_tau: 0.657

# wordpress-bench/s2-throughput

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.258 +/- 0.000
absolute_error: 0.229 +/- 0.117
relative_error: 27.28% +/- 25.84%
relative_error_lenient: 18.95% +/- 13.97%
relative_error_strict: 27.76% +/- 25.57%
normalized_absolute_error: 0.375
root_relative_squared_error: 0.410
squared_error: 0.066 +/- 0.052
correlation: 0.937
squared_correlation: 0.878
prediction_average: 1.317 +/- 0.629
spearman_rho: 0.787
kendall_tau: 0.575

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.515 +/- 0.000
absolute_error: 0.478 +/- 0.193
relative_error: 40.10% +/- 10.92%
relative_error_lenient: 35.00% +/- 12.99%
relative_error_strict: 60.86% +/- 35.80%
normalized_absolute_error: 0.781
root_relative_squared_error: 0.820
squared_error: 0.265 +/- 0.193
correlation: 0.984
squared_correlation: 0.967
prediction_average: 1.317 +/- 0.629
spearman_rho: 0.858
kendall_tau: 0.717

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.642 +/- 0.000
absolute_error: 0.620 +/- 0.166
relative_error: 71.21% +/- 50.79%
relative_error_lenient: 36.36% +/- 17.71%
relative_error_strict: 71.21% +/- 50.79%
normalized_absolute_error: 1.013
root_relative_squared_error: 1.021
squared_error: 0.412 +/- 0.202
correlation: 0.984
squared_correlation: 0.969
prediction_average: 1.317 +/- 0.629
spearman_rho: 0.932
kendall_tau: 0.762

## stressng/network-icmp-flood-bogo-ops

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.470 +/- 0.000
absolute_error: 0.264 +/- 0.389
relative_error: 24.78% +/- 27.44%
relative_error_lenient: 21.11% +/- 23.24%
relative_error_strict: 47.16% +/- 72.48%
normalized_absolute_error: 0.431
root_relative_squared_error: 0.748
squared_error: 0.221 +/- 0.481
correlation: 0.758
squared_correlation: 0.574
prediction_average: 1.317 +/- 0.629
spearman_rho: 0.703
kendall_tau: 0.571

# wordpress-bench/s3-throughput

## stressng/cpu-fft-bogo-ops

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.293 +/- 0.000
absolute_error: 0.219 +/- 0.194
relative_error: 29.83% +/- 19.63%
relative_error_lenient: 25.19% +/- 15.57%
relative_error_strict: 39.91% +/- 30.95%
normalized_absolute_error: 0.820
root_relative_squared_error: 0.897
squared_error: 0.086 +/- 0.123
correlation: 0.525
squared_correlation: 0.276
prediction_average: 0.710 +/- 0.327
spearman_rho: 0.492
kendall_tau: 0.352

## ecu

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.283 +/- 0.000
absolute_error: 0.218 +/- 0.181
relative_error: 30.56% +/- 19.36%
relative_error_lenient: 25.38% +/- 14.65%
relative_error_strict: 39.33% +/- 27.48%
normalized_absolute_error: 0.815
root_relative_squared_error: 0.868
squared_error: 0.080 +/- 0.106
correlation: 0.549
squared_correlation: 0.301
prediction_average: 0.710 +/- 0.327
spearman_rho: 0.547
kendall_tau: 0.417

## vcpus

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.304 +/- 0.000
absolute_error: 0.259 +/- 0.158
relative_error: 38.63% +/- 25.93%
relative_error_lenient: 30.83% +/- 16.30%
relative_error_strict: 53.48% +/- 39.06%
normalized_absolute_error: 0.969
root_relative_squared_error: 0.930
squared_error: 0.092 +/- 0.080
correlation: 0.545
squared_correlation: 0.296
prediction_average: 0.710 +/- 0.327
spearman_rho: 0.556
kendall_tau: 0.465

## sysbench/cpu-multi-thread-duration

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.281 +/- 0.000
absolute_error: 0.240 +/- 0.146
relative_error: 40.73% +/- 30.36%
relative_error_lenient: 27.39% +/- 15.04%
relative_error_strict: 43.79% +/- 29.89%
normalized_absolute_error: 0.898
root_relative_squared_error: 0.860
squared_error: 0.079 +/- 0.072
correlation: 0.560
squared_correlation: 0.314
prediction_average: 0.710 +/- 0.327
spearman_rho: 0.522
kendall_tau: 0.362

## stressng/network-icmp-flood-bogo-ops

PerformanceVector
PerformanceVector:
root_mean_squared_error: 0.320 +/- 0.000
absolute_error: 0.242 +/- 0.209
relative_error: 31.13% +/- 16.91%
relative_error_lenient: 28.30% +/- 15.41%
relative_error_strict: 48.02% +/- 42.40%
normalized_absolute_error: 0.904
root_relative_squared_error: 0.979
squared_error: 0.102 +/- 0.155
correlation: 0.505
squared_correlation: 0.256
prediction_average: 0.710 +/- 0.327
spearman_rho: 0.465
kendall_tau: 0.343
