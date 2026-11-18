# E-commerce Fulfillment Network Performance & Cost Optimization

## Overview

This project analyses e-commerce fulfillment operations across 12 facilities over a period of January 2026 - June 2026.

The objective is to evaluate fulfilment performance, identify operational issues, monitor inventory losses, quality defects and find opportunities to improve operational efficiency and cost performance.

We used SQL for analysis and Tableau for dashboards.

## Dashboards

### 1. E-commerce Fulfillment Network Performance

<img width="1266" height="794" alt="Screenshot 2026-11-17 at 10 25 59 PM" src="https://github.com/user-attachments/assets/b7a7043a-d1cc-47a2-b6ec-431d9229c983" />


* Monitors fulfilment performance and CPT breaches.
* Compares breach rates across facilities and shifts.
* Tracks monthly CPT break trends.
* Evaluate fulfilment cost and labor productivity.

### 2. Facility and Shift Performance

<img width="1268" height="804" alt="Screenshot 2026-11-17 at 10 26 20 PM" src="https://github.com/user-attachments/assets/74fbd6e9-cb28-42d5-aa6d-aad3fc0c2b48" />


* Compares facility and shift-level operational performance.
* Identifies shifts with higher processing times and CPT breaches.
* Examines labor cost and orders processed per labor hour.

### 3. Inventory Loss and Defect Monitoring

<img width="1247" height="791" alt="Screenshot 2026-11-17 at 10 26 09 PM" src="https://github.com/user-attachments/assets/b4f41395-87f6-48b9-bcb9-296ed19f21da" />


* Tracks inventory units lost over time.
* Compares inventory losses and DPMO across facilities.
* Examines defect distribution by defect type.

## Key Insights & Findings

### Fulfilment Performance

* The overall CPT breach rate was 12.26%.
* Evening shift recorded the highest CPT breach rate at 19.54%, compared with 6.49% during the morning shift.
* Evening shift also had the highest average processing time at ~ 38 minutes.
* Siliguri recorded the highest facility-level CPT breach rate at 24.79%, followed by Guwahati at 22.10%.
* Monthly CPT breach rates remained relatively stable, ranging from 12.10% to 12.48%.

### Facility and Labor Performance

* Siliguri recorded the highest average labor cost per order at 102.18.
* It also had the lowest orders per labor hour at 2.15
* Hyderabad has the highest efficiency at 2.95 orders per labor hour and the lowest average labor cost per order at 58.25.

### Inventory Loss and Quality

* A total of 21,581 inventory units were lost during the analysis period.
* Monthly inventory loss increased from 2534 units in January to 4,987 units in June.
* Mumbai recorded the highest inventory loss at 3,343 units, while Bhubaneswar recorded the lowest at 844 units.
* Damaged item was the most frequent defect category with 489 recorded defects followed by Missing Item(484) and Label Error(483).
* Siliguri and Guwahati recorded the highest facility-level DPMO values.

## Recommendations

***1. Prioritize evening shift performance at Siliguri and Guwahati:*** 

The Evening shift has the highest CPT breach rate ~ 19.54% and average processing time 38.20 minuted.Siliguri and Guwahati show has high Evening shift breach rate of 36.26% and 33.02%.

It would be worth looking more closely at these two facilities to understand what is contributing to the delays.

***2. Review Labor Efficiency at Siliguri:*** 

Siliguri has the highest average labor cost per order at 102 and the lowest productivity at 2.15 orders per labor hour.On the other hand, Hyderabad records a lower cost of 58.25 and higher productivity of 2.95 orders per labor.

Comparing the operational performance of these facilities could help identify where the facility in Siliguri is facing efficiency gaps and where improvements may be possible.

***3. Address the increase in inventory losses:*** 

Inventory losses have increased from 2,534 units in January to 4,987 units in June with the highest loss recorded in the last two months of the analysis period.

The increase during May and June deserves further attention.Reviewing inventory loss patterns across facilities could help identify where these losses are increasing and what might be contributing to them.

***4. Strengthen defect prevention:*** 

Damaged item ~ 489,Missing item ~ 484,Label Error ~ 483 are the three most frequently recorded defect categories.

These categories could be prioritised for further review.Checking packaging, item pickup and label verification processes may help identify areas where the number of defects can be reduced.

***5. Investigate Quality Performance at Siliguri and Guwahati:*** 

Siliguri and Guwahati have the highest facility level DPMO values at 11,803 and 11,244 respectively.

Defect patterns and quality processes could help understand why these facilities have higher DPMO values and identify areas that may need improvement.
  




