# How to Obtain the Dataset

## 1. Visit https://insideairbnb.com/get-the-data/

## 2. Select Desired Citites and Download the .csv.gz

### Cities Used:
- Austin, TX; Boston, MA; Chicago, IL; Clark County, NV; Dallas, TX; Denver, CO; Fort Worth, TX; Los Angeles, CA; Nashville, TN; New Orleans, LA; New York City, NY; Portland, OR; San Diego, CA; San Francisco, CA; Seattle, WA; Twin Citites MSA, MN; Washington, D.C.

## 3. Extract the Compressed Files

## 4. Run Data Cleaning Scripts
### Run the following scipts located in `SCRIPTS\`
- `vance` for Austin, Boston, Chicago, Clark County, Dallas, Denver
- `ben` for Fort Worth, Los Angeles, Nashville, New Orleans, New York City, Portland
- `christine` for San Diego, San Francisco, Seattle, Twin Cities, MSA
### These scripts clean the data and conduct random sampling of reviews from each city

## 5. Aggregating the Data
- `aggregate` to combine the 3 subsets into the combined clean dataset
