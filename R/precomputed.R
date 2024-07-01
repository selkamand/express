
#' List Available Datasets
#'
#' This function lists all available datasets for use with the `express` package.
#' It reads a predefined TSV file containing dataset information and returns it as a data frame.
#'
#' @param url show the URL from which the data will be pulled
#' @return A data frame containing the available datasets. The data frame includes columns such as name, type, url, and description.
#' @export
#'
#' @examples
#' # List all available datasets
#' datasets <- express_available_datasets()
#' print(datasets)
express_available_datasets <- function(url=FALSE){
  path_datasets <- system.file("public_tsne_datasets.tsv", package = "express")
  df <- read.csv(file = path_datasets, header = TRUE, sep = "\t")

  if(!url){
    df <- df[, colnames(df) != "url"]
  }
  return(df)
}


#' Fetch and Plot Precomputed Dataset
#'
#' This function retrieves and visualizes precomputed t-SNE data from a specified dataset.
#' It fetches the data from a URL associated with the dataset name provided, and then either
#' returns the data directly or creates a ggplot2 visualization of the t-SNE dimensions.
#'
#' @param dataset A string specifying the name of the dataset to be retrieved. The dataset must be one of the available datasets listed by `express_available_datasets()`.
#' @param interactive A logical value indicating whether the plot should be interactive. Currently, this parameter is not used in the function.
#' @param just_return_data A logical value indicating whether to return only the dataset without generating a plot. Defaults to FALSE.
#' @param datatype A string indicating whether to retrieve \strong{expression} or \strong{methylation} data
#' @return If `just_return_data` is TRUE, a data.table containing the dataset is returned. If `just_return_data` is FALSE and the dataset type is "tsne", a ggplot2 object representing the t-SNE plot is returned. If the dataset type is not "tsne", an error is raised.
#' @export
#'
#' @examples
#' # Retrieve and plot the
#' express_precomputed("GBM")
#'
#' # Retrieve only the data without plotting
#' data <- express_precomputed_tsne("GBM", just_return_data = TRUE)
express_precomputed <- function(dataset, datatype = c("expression", "methylation"), interactive = FALSE, just_return_data = FALSE, title = "auto"){

  datatype <- rlang::arg_match(datatype)

  # Assertions
  assertions::assert_string(dataset)

  # Check if its in the available dataset
  available_datasets <- express_available_datasets(url = TRUE)
  available_datasets <- available_datasets[c(available_datasets[["datatype"]] == datatype),]

  assertions::assert_subset(
    dataset, available_datasets[["name"]],
    msg = "Dataset not found. Please run {.code express_available_datasets()} to list available datasets:"
  )

  # Pull dataset type and URL
  index = match(dataset, available_datasets[["name"]])
  #type = available_datasets[["type"]][index]
  url = available_datasets[["url"]][index]
  description = available_datasets[["description"]][index]
  method = available_datasets[["method"]][index]

  data <- read_from_url(url)

  if(just_return_data) { return(data) }

  if(title == "auto"){
    title = paste0(dataset, " ", method, " (", datatype, ")")
  }

  gg <- ggplot2::ggplot(data, ggplot2::aes(x=Dim1, y = Dim2)) +
    ggiraph::geom_point_interactive(ggplot2::aes(data_id = Sample, tooltip = Sample)) +
    ggplot2::theme_bw() +
    ggplot2::xlab("Dimension 1") +
    ggplot2::ylab("Dimension 2") +
    ggplot2::ggtitle(title) +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold")
      )

    if (interactive) {
      stop("tsne interactivity is not yet implemented")
    }

    return(gg)

}

read_from_url <- function(url){
  #data = data.table::fread(url)
  data = read.csv(url)
  return(data)
}



