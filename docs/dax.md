# 📐 DAX Formulas

## 📊 CY vs PY Measures

Latest month's wait list for the current year (CY) vs. same month's wait list for the previous year (PY)

| **Measure** | **Formula** |
|-------------|-------------|
| LatestMonthWL | `CALCULATE( SUM(All_Data[Total]), All_Data[Archive_Date] = MAX(All_Data[Archive_Date])) + 0` <br><br> MAX(All_Data[Archive_Date]): Gets the latest date in the Archive_Date column. |
| PYSameMonthWL | `CALCULATE(SUM(All_Data[Total]), All_Data[Archive_Date] = EDATE(MAX(All_Data[Archive_Date]), -12)) + 0` <br><br> EDATE(..., -12): Shifts the date back by 12 months to the same month in the previous year. |

## 📉 Dynamic Measures

### 🔄 Average vs. Median Toggle

Create a dynamic measure to toggle between average and median using a slicer with options ("Average" and "Median") and a DAX measure using the SWITCH function.

```dax
Dynamic Waitlist =
SWITCH(
    SELECTEDVALUE('Toggle'[Metric]),
    "Average", AVERAGE(All_Data[Total]),
    "Median", MEDIAN(All_Data[Total])
)
```

### 🏷️ Dynamic Title

A dynamic title to indicate whether average or median was selected:

```dax
Dynamic Title =
SWITCH(
    SELECTEDVALUE('Toggle'[Metric]),
    "Average", "Average Waitlist",
    "Median", "Median Waitlist",
    "Waitlist Analysis"
)
```

## 🧪 Testing Measures

Measures created to dynamically check for blank results based on filter context and display messages in place of empty charts:

| **Measure** | **Formula** |
|-------------|-------------|
| NoDataLeft | `IF(ISBLANK(CALCULATE(sum(All_Data[Total]),All_Data[Case_Type]<>"Outpatient")), "No data for selected specialty", "")` |
| NoDataRight | `IF(ISBLANK(CALCULATE(sum(All_Data[Total]),All_Data[Case_Type]="Outpatient")), "No data for selected specialty", "")` |

Note that the same field ("Outpatient") has been used for simplicity.

## ➕ Additional Measures

### 🧮 Basic Aggregations

```dax
Total Waitlist = SUM(All_Data[Total])
Average Waitlist = AVERAGE(All_Data[Total])
Median Waitlist = MEDIAN(All_Data[Total])
```

### 🏆 Specialty Rankings

```dax
Top 5 Specialties =
IF(
    RANKX(ALL(All_Data[Specialty]), [Dynamic Waitlist]) <= 5,
    [Dynamic Waitlist],
    BLANK()
)
```
