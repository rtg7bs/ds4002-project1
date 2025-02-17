# Project 1: Airbnb Review Sentiment Across Price Ranges

**DS 4002: Prototyping**

**Group 2 - The Predictive Pioneers** 

**Members:** Christine Tsai, Ben Harris, Vance Newsome (leader)

## Project Overview
This project analyzes sentiment in Airbnb reviews from 17 major cities in order to determine how sentiment scores and amenity preferences change across a range of prices. 

## Contents of the Repository
- `README.md` - Overview of the project and instructions for replication.
- `LICENSE.md` - Specifies the terms of use for this repository.
- `SCRIPTS/` - Contains Python and R scripts for data cleaning and analysis.
- `DATA/` - Contains raw and cleaned datasets.
- `OUTPUT/` - Contains tables and figures.

## Software and Platform
### Software Used
- Python 3.12.4, R 4.4.2
- RStudio 2024.9.1.394
### Required Packages
#### Python: 
- `pandas` (data manipulation)
- `numpy` (numerical operations)
- `scikit-learn` (machine learning)
- `matplotlib` (visualization)
- `vadersentiment` (sentiment analysis)
#### R:
- `tidyverse` (data manipulation and visualization)
### Platform
- Windows 11 and macOS 15 Sequoia

## Map of Documentation
├── README.md

├── LICENSE.md

├── SCRIPTS/

│   ├── aggregate_data.ipynb # aggregates the output from the 3 cleaning files

│   ├── cleaning_1.ipynb # For Austin, Boston, Chicago, Clark County, Dallas, and Denver

│   ├── cleaning_2.R # For Fort Worth, Los Angeles, Nashville, New Orleans, New York City, and Portland

│   ├── cleaning_3.ipynb # For San Diego, San Francisco, Seattle, Twin Cities MSA, and Washington, D.C.

│   ├── feature_extract_cluster.ipynb # feature extraction with machine learning

│   ├── linear_reg.ipynb # linear regression

│   ├── vader.ipynb # sentiment scoring of reviews

│   ├── anova_r2.R # ANOVA and R-squared for sentiment scores by attribute

├── DATA/

│   ├── data_appendix.pdf # describes dataset

│   ├── obtain_data.md # instructions on acquiring raw data and getting it to a final, clean state

│   ├── reviews.csv # aggregated dataset of all the reviews

│   ├── reviews_with_sentiment.csv # aggregated dataset with VADER sentiment analysis

├── OUTPUT/

│   ├── pca.png # visualization of clustering

│   ├── sil.png # graph of silhoutte scores for clustering

│   ├── wordstfidf.png # chart of 20 most important words in the reviews


## Instructions for Reproduction
### Step 1: Clone the Repository
### Step 2: Install Dependencies
#### Python:
Install the required packages (list above)
#### R
Install tidyverse package
### Step 3: Obtain and Clean Raw Data 
Follow the instructions in `DATA/obtain_data`
### Step 4: Run Scripts in Order
#### 1. VADER Sentiment
Run `vader.py`
#### 2. Feature Extraction
Run `feature_extract_cluster.ipynb`
#### 3. Linear Regression
Run `linear_reg`
### Step 5: View Resulting Visualizations in `OUTPUT`
