# NHS Appointment Analytics — Diagnostic Analysis Using Python

## Overview

This project analyses NHS appointment and capacity data from Integrated 
Care Boards (ICBs) across England to identify utilisation trends, missed 
appointment patterns, and resource allocation insights. The analysis was 
conducted using real NHS administrative data and is structured to 
communicate findings to both technical and non-technical stakeholders.

**Context:** The NHS incurs significant costs from missed GP appointments. 
This analysis explores the operational drivers of non-attendance and 
provides data-informed recommendations for improving resource utilisation 
across the ICB network.

## Research Questions

1. Has there been adequate staff and capacity across ICB networks?
2. What is the actual utilisation of resources?
3. What patterns are evident in missed appointments, and what operational 
   levers can reduce them?

## Data Sources

- `actual_duration.csv` — Appointment duration and regional data by class
- `appointments_regional.csv` — Appointment type, mode, status, and 
  booking lead time by ICB
- `national_categories.xlsx` — National category appointments by service 
  setting and context type
- `tweets.csv` — NHS-related social media data (Twitter/X) for 
  supplementary sentiment analysis

*Data sourced from NHS England Integrated Care Board administrative 
records.*

## Methods

- **Exploratory Data Analysis (EDA):** Data import, quality assessment, 
  missing value handling, and descriptive statistics using Pandas
- **Diagnostic Analysis:** Trend identification across service settings, 
  context types, and national categories; seasonal and monthly patterns
- **NLP:** Hashtag extraction and keyword analysis on NHS Twitter data 
  to assess public sentiment and identify emerging themes
- **Visualisation:** Publication-quality plots using Matplotlib and Seaborn 
  following design principles (labelled axes, consistent colour themes, 
  appropriate chart selection for audience)
- **Framework:** 5-Whys analytical approach applied to structure 
  root-cause investigation of missed appointments

## Key Findings

- Identified seasonal and monthly trends in appointment utilisation 
  across service settings that inform capacity planning decisions
- Quantified patterns in missed appointments by appointment mode, booking 
  lead time, and healthcare professional type
- Assessed whether current infrastructure capacity is adequate relative 
  to demand trends
- Demonstrated the potential value of social media data as a supplementary 
  signal for NHS operational monitoring

## Repository Structure

```
├── Pandit_Reshma_DA201_Assignment_Notebook.ipynb  # Full analysis
├── Pandit_Reshma_DA201_Assignment_Report.docx     # Technical report
├── Pandit_Reshma_DA201_Assignment_Presentation.pptx # Stakeholder slides
└── README.md
```

## Skills Demonstrated

- Python (Pandas, Matplotlib, Seaborn, re/NLP)
- Data wrangling and quality assessment on real administrative datasets
- EDA and diagnostic analysis
- Stakeholder communication — dual outputs for technical and business audiences
- PEP 8 compliant, well-documented, reproducible code

## Assessment Feedback

*"You've produced an excellent and well-structured project that demonstrates 
strong coding and analytical ability. Your notebook is clean and organized, 
with functions efficiently handling repetitive tasks in line with PEP 8 
guidelines. The visualizations are thoughtfully designed with clear labels, 
captions, and consistent color themes."*
— LSE/FourthRev Assessor

## How to Run

1. Clone this repository
2. Install dependencies: `pip install pandas matplotlib seaborn openpyxl`
3. Open `Pandit_Reshma_DA201_Assignment_Notebook.ipynb` in Jupyter
4. Run all cells sequentially

*Note: Raw data files are not included in this repository as they are 
NHS administrative data. The notebook structure and outputs are fully 
documented for reproducibility.*
