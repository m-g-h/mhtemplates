#' Sets up a python virtualenv adn Rprofile and configures reticulate
#' for use in the current directory/project
#'
#' Also see https://support.rstudio.com/hc/en-us/articles/360023654474-Installing-and-Configuring-Python-with-RStudio
#'
#' @return NULL
#' @export
#'
#' @importFrom crayon blue
#' @importFrom rstudioapi restartSession
#' @importFrom utils menu
#'
setup_reticulate <- function() {

  ## Create virtual environment with virtualenv called .venv
  message("Setting up virtual environment")
  system("virtualenv .venv")

  ## Activate the virtual environment
  message(crayon::blue("ACTION REQUIRED: "),
    "Activate .venv with command `source .venv/Scripts/activate` in your terminal")
  x <- menu(title = "Continue?",
            choices = "Yes")

  ## Update pip
  message("Update pip")
  system(".venv/Scripts/python -m pip install --upgrade pip")

  ## Setup Rprofile
  message("Setup 'Rprofile.R' for reticulate")
  writeLines('Sys.setenv(RETICULATE_PYTHON = ".venv/Scripts/python.exe")',
             con = ".Rprofile")
  ## Restart R and configure reticulate
  choice <- menu(title = "R will restart now to setup reticulate. Proceed?",
       choices = c("Yes", "No"))
  if(choice == 1){
    message("Restart R and configure reticulate")
    rstudioapi::restartSession(command = 'reticulate::py_config()
                             message("FINISHED")')
  }
  if(choice == 2){
    message("Setup aborted. To finish, restart your R session and run `reticulate::py_config()`")
  }
}

