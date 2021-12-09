# Giant Pumpkins: weight prediction

-   **Authors:** Mahsa Sarafrazi, Rowan Sivanandam, Shiva Jena, and Vanessa Yuen

-   **Contributors:** Instructors, and Teaching Assistants of the course DSCI 522 of UBC Master of Data Science Vancouver program at the University of British Columbia, Vancouver

Analytical project prepared as part of the course DSCI 522 of the Master of Data Science 2021-22 program at University of British Columbia, Vancouver.

## About the project

This analytical project is an attempt at creating a machine learning linear regression model to predict a continuous variable, weight of giant pumpkins based on features such as type of pumpkin, place of cultivation (country, city, state province, GPC site), seed origins, pollinator father, etc.

### Background on Giant Pumpkins and GPC

The data set used in this project is originally from BigPumpkins.com. The Great Pumpkin Commonwealth's (GPC) mission promotes the hobby of cultivating giant pumpkins throughout the world through standards and regulations to ensure quality of fruit, fairness of competition, recognition of achievement, fellowship and education for all participating growers and weigh-off sites. (Read more from ("The Great Pumpkin Commonwealth" 2021) [here](https://gpc1.org/ "GPC website") and ("Bigpumpkins.com: A Giant Pumpkin Growing Community," n.d.) [here](http://www.bigpumpkins.com/ "Data on giant pumpkins from bigpumkins.com")).

### Raw data

The dataset is a public domain resource which pertains to the attributes of giant pumpkins grown in around 20 countries across the world in different regions. The raw data which was used in this project for the analysis can be found [here.](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-10-19/pumpkins.csv "Raw data")

### Predictive question and sub-questions

Given certain features of the seeds, place of cultivation, features of the parent pumpkin etc, what will be estimated weight of the giant pumpkin after harvesting?

To answer this predictive question, we need to first answer some underlying data related questions such as:

-   Is there a relationship between features of the seeds, place of cultivation, and the weight of the pumpkins?

-   How are the weights distributed across regions?

## Method

The majority of the raw data comprises of features of the character type where some of the features such as `id` contain important information such as the pumpkin type. Therefore, in order to proceed, an initial data cleaning, preparation and pre-processing is required to make the features ready for training purposes. However, since the analysis is an attempt to answer a machine learning prediction problem, the dataset is first split into a 70/30 split for the training and test sets respectively along with random seeding for reproducibility. Brief details of the steps are mentioned below for an outline:

1.  **Train Test Split**  
    Splitting the dataset into train and test splits along with random seed for reproducibility.

    The desired outputs are a 70/30 split of training and test data.

2.  **Exploratory Data Analysis (EDA):**

    Data cleaning and preparation is required for making features ready for the machine learning regression model. An analysis of the trends and correlation with actual pumpkin weights and various features will be used using Python (Van Rossum and Drake 2009) and Altair (VanderPlas et al. 2018) as visualisation tools.

    On initial observations, the data seems to be mostly from the US. The distribution of the GPC sites, city and state/province are more evenly distributed. We consider these columns as good features to be used. Plots of the mean weight of giant pumpkins against different features (ott, country, city, state, gpc site) also suggest these features relates to the target (weight).

    The processed data sets in form of .csv files.

3.  **Predictive Modelling**

    The Ridge Linear Regression model will be used as pumpkin weight is a continuous, quantitative, numerical variable. The model is planned to be trained and tested using Scikit Learn (Pedregosa et al. 2011) packages.

    There are few numerical features and more categorical features. For numerical features, SimpleImputer and StandardScaler will be used during the preprocessing stage where as for categorical features, One-Hot Encoding and SimpleImputer for will ready the data for analysis.

    Using column transformers and pipe operators, cross-validation will be performed for hyperparameter optimization of sklearn's LinearRegression model using GridSearchCV.

    After optimising the hyperparameters, the model will be fit on the training set and evaluation to be done on the test set. In the initial stages, the R-squared score will be the underlying metrics used to assess our model.

## Report

Results of the analysis can be found [here](https://github.com/UBC-MDS/Giant_Pumpkins_Weight_Prediction/blob/main/doc/pumpkin.html) .

## Dependencies

The dependencies for this project can be found in `environment.yaml` located [here](https://raw.githubusercontent.com/UBC-MDS/Giant_Pumpkins_Weight_Prediction/main/environment.yaml). The yaml file needs to be run to create the environment required for running the analysis. If conda is installed, the following command can be run at the terminal/ command line from the root directory of this project folder ("…/Giant_Pumpkins_Weight_Prediction/") to install the dependencies:

    conda env create -f environment.yaml

After having finished the work with our project, the following command can be run to deactivate the environment in the terminal/command line:

    conda deactivate 

The list of dependencies are given below which are tentative and may change as per updates in the environment file:

-   altair_saver==0.5.0=py_0

-   requests[version='>=2.24.0']

-   pandas[version='>=1.3.\*']

-   vega_datasets=0.9.0

-   ipykernel=6.5.1

-   altair==4.1.0=py_1

-   graphviz=2.49.3

-   python-graphviz=0.19

-   scikit-learn[version='>=1.0']

-   altair_data_server==0.4.1=py_0

-   pandoc=2.16.2

-   altair_viewer==0.4.0=pyhd8ed1ab_0

-   matplotlib[version='>=3.2.2']

-   docopt=0.6.2

For generating the plots in the report, install the following packages with this command in the environment created:

    conda activate pumpkin
    npm install -g vega vega-cli vega-lite canvas

If the above is already installed, the file may already exist and therefore, it may throw an error asking to force install, which may be ignored.

## Usage

For replicating the analysis and usage, clone this GitHub repository, install dependencies for creating the environment as stated above and run the following scripts in the `pumpkin` environment created. You may run the following commands at the root directory of the cloned repository folder.

#### Option 1: This approach ensures a cleaned directory post reviewing the results.

This approach generates the report through `make` and helps cleaning up all the related files generated in the process. Run the following commands in the Command line/ Terminal in the root directory of the project after activating the environment:

To run all the scripts and generate the final report, run the `Makefile` through the following command:

    make all

To clean up the files generated and reinstate to the initial cloned state, run the following command in the Command Line/ Terminal:

    make clean

#### Option 2: This approach is an alternative to `make` :

This approach runs all the scripts to create the files and the final report. Make sure to activate the `pumpkin` environment.

    bash run_all.sh  

#### Option 3: This approach runs individual scripts in case the above do not run:

    # Download raw data
    python src/script/download_data.py --url="https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-10-19/pumpkins.csv" --out_file="data/raw/pumpkins.csv"

    # Clean data and split the data into train/test set
    python src/script/clean_split_train_test.py --file="data/raw/pumpkins.csv" --out_dir="data/processed"

    # Perform exploratory data anlysis
    python src/script/eda.py --file="data/processed/pumpkins_train.csv" --out_dir="doc/result"

    # Perform data preprocessing and tune regression model
    python src/script/preprocessor_model.py --file="data/processed/pumpkins_train.csv" --out_dir="doc/result"

    # Evalate the model with test result
    python src/script/evaluate.py --file='data/processed/pumpkins_test.csv' --object_file='doc/result/model.pickle' --out_dir='doc/result'


    # Render final report
    Rscript -e "rmarkdown::render('doc/pumpkin.Rmd')"

All of the above options create the files along with the final report file `pumpkin.html`, which rests in the `doc` directory of this project. To open the final report html file directly, run the following command in the Command Line/ Terminal:

    open doc/pumpkin.html

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-bigpumpkin" class="csl-entry">

“Bigpumpkins.com: A Giant Pumpkin Growing Community.” n.d.
*BigPumpkins.com: A Giant Pumpkin Growing Community*.
<http://www.bigpumpkins.com/>.

</div>

<div id="ref-scikit-learn" class="csl-entry">

Pedregosa, F., G. Varoquaux, A. Gramfort, V. Michel, B. Thirion, O.
Grisel, M. Blondel, et al. 2011. “Scikit-Learn: Machine Learning in
Python.” *Journal of Machine Learning Research* 12: 2825–30.

</div>

<div id="ref-gpc" class="csl-entry">

“The Great Pumpkin Commonwealth.” 2021. *The Great Pumpkin Commonwealth
\| Our Organization Promotes Encourages and Promotes the Participation
in Growing Giant Fruits and Vegetables.* <https://gpc1.org/>.

</div>

<div id="ref-Python" class="csl-entry">

Van Rossum, Guido, and Fred L. Drake. 2009. *Python 3 Reference Manual*.
Scotts Valley, CA: CreateSpace.

</div>

<div id="ref-vanderplas2018altair" class="csl-entry">

VanderPlas, Jacob, Brian Granger, Jeffrey Heer, Dominik Moritz, Kanit
Wongsuphasawat, Arvind Satyanarayan, Eitan Lees, Ilia Timofeev, Ben
Welsh, and Scott Sievert. 2018. “Altair: Interactive Statistical
Visualizations for Python.” *Journal of Open Source Software* 3 (32):
1057.

</div>

</div>
