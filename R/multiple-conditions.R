#' @title Multiple chronic conditions
#' 
#' @description This function generates a derived variable (multiple_conditions)
#'  that counts the number of chronic conditions a respondent has. This function
#'  takes 6 CCHS variables (heart disease, cancer, stroke, bowel disorder, and
#'  arthritis), and well one derived variable (respiratory condition) to count
#'  the number of conditions a respondent has.
#'  
#' @param CCC_121 variable indicating if respondent has heart disease
#' 
#' @param CCC_131 variable indicating if respondent has active cancer
#' 
#' @param CCC_151 variable indicating if respondent suffers from the effects
#'  of a stroke
#' 
#' @param CCC_171 variable indicating if respondent has a bowel disorder
#' 
#' @param CCC_280 variable indicating if respondent has a mood disorder. Note,
#'  variable was not asked to respondents in the 2001 CCHS survey cycle
#' 
#' @param resp_condition_der derived variable indicating if respondent has a
#'  respiratory condition. See \code{\link{resp_condition_fun1}} for
#'  documentation on how variable was derived
#'
#' @param CCC_051 variable indicating if respondent has arthritis or
#'  rheumatism
#'
#' @note mood disorder (CCC_280) was not asked to respondents in the 2001 CCHS
#'  survey cycle. This mean respondents in this cycle will only be able to have
#'  a maximum of 6 chronic conditions as opposed to 7 for respondents in other
#'  cycles.
#' 
#' @return A categorical variable indicating the number of chronic conditions
#'  a respondent has. Respondents with 5 or more conditions are grouped in the
#'  "5+" category. 
#' 
#' @examples 
#'  # Using multiple_conditions_fun() to generate multiple_conditions in a CCHS
#'  # cycle.
#'  
#'  # multiple_conditions_fun() is specified in variable_details.csv along with
#'  # the CCHS variables and cycles included.
#'  
#'  library(cchsflow)
#'  conditions_2010 <- rec_with_table(cchs2010, c("CCC_121","CCC_131","CCC_151",
#'  "CCC_171","CCC_280","resp_condition_der","CCC_051", "multiple_conditions"))
#'  
#'  head(conditions_2010)
#'  
#' @export

multiple_conditions_fun <- 
  function(CCC_121,CCC_131,CCC_151,CCC_171,CCC_280,resp_condition_der,CCC_051){
    
    # Convert variables to numeric
    CCC_121 <- as.numeric(CCC_121)
    CCC_131 <- as.numeric(CCC_131)
    CCC_151 <- as.numeric(CCC_151)
    CCC_171 <- as.numeric(CCC_171)
    CCC_280 <- as.numeric(CCC_280)
    resp_condition_der <- as.numeric(resp_condition_der)
    CCC_051 <- as.numeric(CCC_051)
    
    # verify for NA
    CCC_121 <- if_else2(is.na(CCC_121), 0, CCC_121)
    CCC_131 <- if_else2(is.na(CCC_131), 0, CCC_131)
    CCC_151 <- if_else2(is.na(CCC_151), 0, CCC_151)
    CCC_171 <- if_else2(is.na(CCC_171), 0, CCC_171)
    CCC_280 <- if_else2(is.na(CCC_280), 0, CCC_280)
    resp_condition_der <- if_else2(is.na(resp_condition_der), 0,
                                   resp_condition_der)
    CCC_051 <- if_else2(is.na(CCC_051), 0, CCC_051)
    
    # adjust resp_condition to yes = 1, no = 2
    resp_condition_der <- if_else2(resp_condition_der %in% c(1:2), 1,
                               if_else2(resp_condition_der == 3, 2, 0))
    
    # Calculate number of conditions based on yes
    conditions <- (CCC_121%%2) + (CCC_131%%2) + (CCC_151%%2) +(CCC_171%%2) +
      (CCC_280%%2) + (resp_condition_der%%2) + (CCC_051%%2)
    
    if_else2(conditions>= 5, "5+", conditions)
  }