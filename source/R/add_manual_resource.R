add_manual_resource <- function(package, new_resource, replace = TRUE) {
  if (replace) {
    # Filter out any resource with same name or path
    package$resources <- Filter(function(res) {
      !(res$name == new_resource$name && res$path == new_resource$path)
    }, package$resources)
  } else {
    # If not overwriting, check for duplicates and warn
    conflict <- any(vapply(package$resources, function(res) {
      res$name == new_resource$name && res$path == new_resource$path
    }, logical(1)))

    if (conflict) {
      warning(paste("Resource with same name and path already exists and",
                    "`replace = FALSE`. Skipping."))
      return(package)
    }
  }

  # Append new resource
  package$resources <- append(package$resources, list(new_resource))
  return(package)
}
