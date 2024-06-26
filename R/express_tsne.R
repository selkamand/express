
#' Title
#'
#' @param data
#' @param method
#' @param gene_selector
#' @param sample_metadata
#' @param colour_by
#' @param perplexity if NULL, autocalculate
#'
#' @return
#' @export
#'
#' @examples
express_sample_relatedness <- function(
  data,
  method = "TSNE",
  gene_selector = "most_variable",
  sample_metadata = NULL,
  colour_by = NULL,
  perplexity = 30
){

  # Matching
  method <- rlang::arg_match(method)
  gene_selector <- rlang::arg_match(method)

  # Assertions
  assertions::assert_dataframe(data)
  if(!is.null(sample_metadata)) assertions::assert_dataframe(sample_metadata)
  if(!is.null(colour_by)) {
    assertions::assert_non_empty_string(colour_by)
    assertions::assert(!is.null(sample_metadata), msg = "To colour by [{colour_by}] you must supply a data.frame with the columns [sample] and [{colour_by}] to the {.arg sample_metadata} argument.")
  }

  # Select Genes
  #<Yet to implement>


  ## Plot t-SNE
  if(method == "TSNE"){
    requireNamespace("Rtsne", quietly = TRUE)
    assertions::assert_names_include(data, names = c("sample", "gene", "expression"))
    df_wide <- tidyr::pivot_wider(data, id_cols = sample, names_from = "gene", values_from = "expression")

    # Warn if perplexity is not sensible
    max_perplexity = (nrow(df_wide) - 1)/3
    if(perplexity >= max_perplexity) cli::cli_alert_warning("Perplexity is too large")


    # Run Tsne
    tsne <- Rtsne::Rtsne(
      df_wide_normalised[-1],
      pca = FALSE,
      normalize= TRUE,
      perplexity = perplexity
    )

  }
  else{
    stop("Method not yet implemented: ", method)
  }

}
