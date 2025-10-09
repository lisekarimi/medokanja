# 🩺📈 Medokanja - Patient Waitlist Analysis

[![Live Demo](https://img.shields.io/badge/Live%20Demo-Power%20BI-blue?style=for-the-badge)](https://app.powerbi.com/view?r=eyJrIjoiNWJmZjVlMmEtZGJjZC00MjAyLWI0ZjUtNmMwYWRkMWNmNjRkIiwidCI6ImYxNThkZGMxLTExYTUtNDhjOS1iNjUzLWRhMzY5MTNjMGUxNyJ9)
[![MEDOKANJA](https://img.shields.io/badge/MEDOKANJA-Live%20Site-green?style=for-the-badge)](https://medokanja.lisekarimi.com/)

## 📋 Overview
Medokanja is a Power BI project designed to improve a hospital's healthcare system by analyzing patient waitlists, identifying bottlenecks, and optimizing resource allocation to enhance patient care.

The name "Medokanja" combines "Medo" (medical) and "Kanja" (patient in Japanese).

[👁️ View the app here](https://medokanja.lisekarimi.com/)

## 📂 Project Structure
- `powerbi` - Contains the core Power BI files.
    - `bg` - Background files used in reports.
    - `data` - Input data files.
    - `src` - Power BI source code files.
- `static` - css and images
- `docs` - Project documentation.
- `index.html` - Main HTML file for dashboard display in a web page.

## 📝 Project Documentation
Refer to the project documentation in the **Wiki** to gain a comprehensive and technical understanding of the project: [https://medokanja.lisekarimi.com/docs](https://medokanja.lisekarimi.com/docs)

The documentation provides an in-depth analysis of transformations applied to raw data, a comprehensive data dictionary, insights into data distribution patterns, a well-defined design blueprint, and a technical breakdown of each report page, including measures calculated using DAX formulas.

Additionally, it outlines key insights and a strategic action plan to optimize waitlists and enhance the healthcare system's efficiency.

## 🛠️ Setup

📚 Prerequisites

To work with this project, you need the following:
- Tools Required:
    - Power BI Desktop for designing and visualizing dashboards.
    - Power BI App to publish dashboards (requires a Power BI account)
    - Microsoft Excel for opening data files and performing initial checks before loading into Power BI.

- Required Skills:
    - Build and publish reports with proficiency in Power BI.
    - Knowledge of Average vs. Median to interpret visualizations and metrics effectively.

📥 Installation

```
git clone https://github.com/lisekarimi/medokanja.git
cd medokanja
```

## 🚀 Run

Navigate to the `medokanja\src` directory and open `medokanja.pbip` in Power BI Desktop. This will allow you to view and interact with the dashboards. Note that .pbip files are specifically designed for Git integration, offering improved version control.

## Update the File Path in Power Query
To display data in Power Query and access it in Power BI, we've implemented a dynamic `filepath` query, making it easy to update the path when the file is moved to a different folder.

Follow these steps to update the file path:
1. Go to Transform Data.
2. Select the `filepath` query in the left panel.
3. Replace the current path with your local folder path, e.g. C:\users\yourname. The query will use this path dynamically, e.g. `filepath&"medokanja\powerbi\data\Inpatient" `
4. Click Close & Apply to save changes.
