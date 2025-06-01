{% include navbar.html %}  {% include top-box.html %}

## Data
Here is an overview of different types of data available from COAT's web page.

| Data type | Description | Link |
|----------|----------|----------|
| Data sets | Data sets in general | [Data sets](https://data.coat.no/dataset/){:target="blank"} |
| State variables | Environmental data from stations | [State variables](https://data.coat.no/state-variable/){:target="blank"} |


## R code example
```r
# Load the dataset
dataset <- read.csv("example_data.csv")

# Check the first few rows
head(dataset)

# Set seed for reproducibility
set.seed(123)

# Define the sample size (e.g., 70% training, 30% testing)
sample_size <- floor(0.7 * nrow(dataset))

# Generate random row indices for training set
train_indices <- sample(seq_len(nrow(dataset)), size = sample_size)

# Split the dataset
train_data <- dataset[train_indices, ]
test_data  <- dataset[-train_indices, ]

# Print the number of rows in each set
cat("Training set rows:", nrow(train_data), "\n")
cat("Test set rows:", nrow(test_data), "\n")
```
