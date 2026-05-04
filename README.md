Fintech Fraud Monitoring System: Real-Time Risk Analytics

Project Overview

The Fintech Fraud Monitoring System is a comprehensive data engineering and analytics platform designed to detect fraudulent credit card transactions. Moving beyond simple rule-based filters, this system identifies deep feature correlations and anomalous temporal trends to secure transaction pipelines.

The project follows a rigorous, three-stage analytical pipeline:
1. EDA & Cleaning: Processing 284,807 records in Jupyter Notebook.
2. Data Engineering: Enterprise-grade storage and validation in PostgreSQL.
3. BI Layer: Interactive "Security Command Center" in Power BI for live monitoring.

 
Technology StackAnalytics Environment:
1. Jupyter Notebook (Python 3.x).
2. Libraries: Pandas, NumPy, Seaborn, Matplotlib.
3. Database: PostgreSQL (pgAdmin 4).
4. Business Intelligence: Power BI Desktop (DAX, Cross-Filtering).
  
Key Insights & Findings
1. The V17 Threshold: Identified a critical anomaly window. V17 values between -25 and -15 correlate with a 100% fraud probability.
2. Peak Attack Window: Analysis reveals that fraud attempts peak during business hours (10:00 AM – 6:00 PM) to blend with high legitimate traffic.
3. Micro-Fraud Strategy: Approximately 89% of alerts fall in the <$100 bracket, indicating a dominant strategy to evade standard high-value filters.
4. Global Impact: 58% of attacks occur during the day, requiring heightened monitoring during standard shifts.

MethodologyData Acquisition:
1. Cleaning raw CSV files and feature engineering hourly buckets.
2. Relational Storage: Exporting structured data to PostgreSQL for high-performance querying and validation.
3. Metric Development: Creating custom DAX measures for Fraud Probability and Risk Scores.
4. UI/UX Optimization: Implementing a high-contrast dark theme for better visibility of "Red Flag" transactions.

Business Recommendations
1. Automated Flagging:Trigger high-priority alerts for any transaction where V17 < -18.
2. Surveillance: Increase manual audit frequency during identified peak attack windows.
3. Risk Scoring: Integrate behavioral patterns (like V17) into risk scores rather than relying solely on amounts.
  
Project Structure

├── Data/                   # Link to dataset (Kaggle/Drive)
├── Jupyter/                # Python Notebooks for EDA
├── SQL_Queries/            # SQL scripts for DB setup and validation
├── PowerBI_Report/         # .pbix file of the dashboard
└── README.md               # Project documentation
