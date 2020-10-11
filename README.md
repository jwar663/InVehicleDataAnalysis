# InVehicleDataAnalysis

### Purpose
To compare and analyse the variables and results of the in-vehicle driving simulation dashboard/gesture experiment

### Run
* Download [R](https://www.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/download/) for your preferred operating system
* Clone the repository onto your local device
* Open r_data_analysis.R with RStudio
* Access and identify the location of the dataset extracted from the driving simulator, add this absolute path to the file_path variable 
* In RStudio, highlight the segment of code you want to execute and use CTRL+ENTER
* Install packages the first time you run the code
* Each time you open RStudio, load the libraries again
* Run the relevant segments of code, depending on the information/analysis you require

### Driving simulator data set
* The driving simulator should return a csv file with columns: ID, DASHBOARD_FIRST, DASHBOARD_GESTURE, REACTION_TIME, DRIVING_ERRORS, INTERACTION_ERRORS
* ID - Unique identifier of the participant
* DASHBOARD_FIRST - TRUE if the participant completed the dashboard experiment first, FALSE otherwise
* DASHBOARD_GESTURE - Which experiment is being completed; either DASHBOARD or GESTURE
* REACTION_TIME - Overall reaction time to complete specified interaction in seconds
* DRIVING_ERRORS - The integer value, number of times a driving error occurred
* INTERACTION_ERRORS - The integer value, number of times the wrong interaction occurred
