% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/facet_trelliscope.R
\name{facet_trelliscope}
\alias{facet_trelliscope}
\title{Facet Trelliscope}
\usage{
facet_trelliscope(..., nrow = 1, ncol = 1, name = NULL,
  group = "common", desc = "", md_desc = "", path = NULL,
  height = 500, width = 500, state = NULL, jsonp = TRUE,
  as_plotly = FALSE, plotly_args = NULL, self_contained = FALSE,
  thumb = TRUE)
}
\arguments{
\item{...}{all parameters passed onto \code{ggplot2::\link[ggplot2]{facet_wrap}}}

\item{nrow}{the number of rows of panels to display by default}

\item{ncol}{the number of columns of panels to display by default}

\item{name}{name of the display}

\item{group}{group that the display belongs to}

\item{desc}{description of the display}

\item{md_desc}{optional string of markdown that will be shown in the viewer for additional context about the display}

\item{path}{the base directory of the trelliscope application}

\item{height}{height in pixels of each panel}

\item{width}{width in pixels of each panel}

\item{state}{the initial state the display will open in}

\item{jsonp}{should json for display object be jsonp (TRUE) or json (FALSE)?}

\item{as_plotly}{should the panels be written as plotly objects?}

\item{plotly_args}{optinal named list of arguments to send to \code{ggplotly}}

\item{self_contained}{should the Trelliscope display be a self-contained html document? (see note)}

\item{thumb}{should a thumbnail be created?}
}
\description{
Facet Trelliscope
}
\note{
Note that \code{self_contained} is severely limiting and should only be used in cases where you would either like your display to show up in the RStudio viewer pane, in an interactive R Markdown Notebook, or in a self-contained R Markdown html document.
}
\examples{
\dontrun{
library(ggplot2)

# basically swap out facet_wrap for facet_trelliscope
qplot(cty, hwy, data = mpg) +
  facet_trelliscope(~ class + manufacturer)

# not required, but if you set labels, these will be added as
# descriptions to the cognostics that are automatically computed
mpg <- set_labels(mpg, mpg_labels)

qplot(cty, hwy, data = mpg) +
  xlim(7, 37) + ylim(9, 47) + theme_bw() +
  facet_trelliscope(~ manufacturer + class, nrow = 2, ncol = 4)

# using plotly
library(plotly)
qplot(cty, hwy, data = mpg) +
  xlim(7, 37) + ylim(9, 47) + theme_bw() +
  facet_trelliscope(~ manufacturer + class, nrow = 2, ncol = 4, as_plotly = TRUE)

qplot(class, cty, data = mpg, geom = c("boxplot", "jitter")) +
  facet_trelliscope(~ class, ncol = 7, height = 800, width = 200,
    state = list(sort = list(sort_spec("cty_mean")))) +
  ylim(7, 37) + theme_bw()
}
}

