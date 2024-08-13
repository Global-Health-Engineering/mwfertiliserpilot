#' mwfertiliserpilot: Fertilizer management pilot survey for maize cultivation in Ntonda EPA, Malawi
#'
#' Data from 129 farmers in the Ntonda Extension Planning Area (EPA) of Blantyre District, Malawi, regarding their maize cultivation practices.
#'
#' @format A tibble with 129 rows and 123 variables
#' \describe{
#'   \item{start}{Survey start}
#'   \item{end}{Survey end}
#'   \item{today}{Survey date}
#'   \item{consent}{Do you give consent to proceed with this survey?}
#'   \item{village_name}{Please enter the name of the village.}
#'   \item{gvh_name}{Please enter the name of the group village head (GVH).}
#'   \item{ta_name}{Please enter the name of the traditional authority (TA).}
#'   \item{farmer_gender}{Please enter the farmer's gender.}
#'   \item{farmer_age}{Please enter the farmer's age.}
#'   \item{farmer_hoh}{Are you the head of the household?}
#'   \item{hoh_education}{What is your highest level of education?}
#'   \item{n_years_farming}{How many years have you been farming?}
#'   \item{own_livestock}{Do you own any livestock (cows, chickens, pigs, etc.)?}
#'   \item{own_livestock_animals}{Do you own...?}
#'   \item{own_livestock_animals.cows}{Cows}
#'   \item{own_livestock_animals.chickens}{Chickens}
#'   \item{own_livestock_animals.pigs}{Pigs}
#'   \item{own_livestock_animals.goats}{Goats}
#'   \item{own_livestock_animals.sheep}{Sheep}
#'   \item{own_livestock_animals.other}{Other livestock}
#'   \item{farming_main_income}{Is farming your household's main source of income?}
#'   \item{household_main_income}{What is your household's main source of income?}
#'   \item{n_acres_farm}{How large is your farm (in acres)?}
#'   \item{n_acres_maize}{How much area is dedicated to maize farming (in acres)?}
#'   \item{source_water_farm}{Is this area rain-fed or part of an irrigation scheme?}
#'   \item{chem_fertilizer}{Did you apply chemical fertilizer this year?}
#'   \item{chem_fertilizer_type}{What chemical fertilizer do you use?}
#'   \item{n_bags_npk}{How many bags of NPK did you apply THIS YEAR?}
#'   \item{n_bags_npk_subsidized}{How many of those were subsidised?}
#'   \item{price_bags_npk_nonsubsidized}{How much did you pay for a full-priced bag of NPK?}
#'   \item{price_bags_npk_subsidized}{How much did you pay for a subsidised bag of NPK?}
#'   \item{enough_bags_npk}{Was this enough NPK to meet your needs?}
#'   \item{n_bags_npk_desired}{How many bags of NPK would you have liked?}
#'   \item{n_bags_npk_buying_next_year}{How many bags of NPK will you try to buy for the coming year?}
#'   \item{n_bags_urea}{How many bags of urea did you apply THIS YEAR?}
#'   \item{n_bags_urea_subsidized}{How many of those were subsidised?}
#'   \item{price_bags_urea_nonsubsidized}{How much did you pay for a full-priced bag of urea?}
#'   \item{price_bags_urea_subsidized}{How much did you pay for a subsidised bag of urea?}
#'   \item{enough_bags_urea}{Was this enough urea to meet your needs?}
#'   \item{n_bags_urea_desired}{How many bags of urea would you have liked?}
#'   \item{n_bags_urea_buying_next_year}{How many bags of urea will you try to buy for the coming year?}
#'   \item{able_buy_bags_past}{Were you able to buy all the fertilizer you require 5 years ago?}
#'   \item{n_bags_maize_t1_season}{How many bags of maize did you harvest in the last growing season?}
#'   \item{n_bags_maize_t2_season}{How many bags of maize did you harvest two growing seasons ago?}
#'   \item{n_bags_maize_t3_season}{How many bags of maize did you harvest three growing seasons ago?}
#'   \item{fertilizer_comparison_5years}{Do you need more, less or the same amount of chemical fertilizer to grow the same amount of maize now as you did 5 years ago?}
#'   \item{same_tool_for_fertilizer}{Do you use the same tool to apply NPK (basal) and urea (topdressing)?}
#'   \item{single_tool_fertilizer}{What tool do you use to apply them?}
#'   \item{single_tool_fertilizer_other}{Please specify.}
#'   \item{tool_basal_fertilizer}{What tool do you use to apply NPK (basal fertilizer) in your field?}
#'   \item{tool_basal_fertilizer_other}{Please specify.}
#'   \item{tool_topdressing_fertilizer}{What tool do you use to apply urea (topdressing fertilizer) in your field?}
#'   \item{tool_topdressing_fertilizer_other}{Please specify.}
#'   \item{timing_fertilizer}{Do you apply NPK and urea at different times or the same time?}
#'   \item{timing_fertilizer_mix_ntimes}{Do you apply the mix once or twice?}
#'   \item{timing_fertilizer_mix}{When do you apply them?}
#'   \item{timing_fertilizer_mix_other}{Please specify.}
#'   \item{place_fertilizer_mix}{Where do you apply them?}
#'   \item{place_fertilizer_mix_other}{Please specify.}
#'   \item{ratio_fertilizer_mix_npk}{What's the NPK to urea ratio? Enter the number for NPK:}
#'   \item{ratio_fertilizer_mix_urea}{What's the NPK to urea ratio? Enter the number for urea:}
#'   \item{timing_fertilizer_mix_t1}{When do you apply them for the first application?}
#'   \item{timing_fertilizer_mix_t1_other}{Please specify.}
#'   \item{place_fertilizer_mix_t1}{Where do you apply them for the first application?}
#'   \item{place_fertilizer_mix_t1_other}{Please specify.}
#'   \item{ratio_fertilizer_mix_t1_npk}{What's the NPK to urea ratio for the first application? Enter the number for NPK:}
#'   \item{ratio_fertilizer_mix_t1_urea}{What's the NPK to urea ratio for the first application? Enter the number for urea:}
#'   \item{timing_fertilizer_mix_t2}{When do you apply them for the second application?}
#'   \item{timing_fertilizer_mix_t2_other}{Please specify.}
#'   \item{place_fertilizer_mix_t2}{Where do you apply them for the second application?}
#'   \item{place_fertilizer_mix_t2_other}{Please specify.}
#'   \item{ratio_fertilizer_mix_t2_npk}{What's the NPK to urea ratio for the second application? Enter the number for NPK:}
#'   \item{ratio_fertilizer_mix_t2_urea}{What's the NPK to urea ratio for the second application? Enter the number for urea:}
#'   \item{timing_basal_fertilizer}{When do you apply NPK (basal fertilizer)?}
#'   \item{timing_basal_fertilizer_other}{Please specify.}
#'   \item{place_basal_fertilizer}{Where do you apply NPK (basal fertilizer)?}
#'   \item{place_basal_fertilizer_other}{Please specify.}
#'   \item{timing_topdressing}{When do you apply urea (topdressing fertilizers)?}
#'   \item{timing_topdressing_other}{Please specify.}
#'   \item{place_topdressing}{Where do you apply urea (topdressing fertilizers)?}
#'   \item{place_topdressing_other}{Please specify.}
#'   \item{basal_fertilizer_grams}{Grams of basal fertilizer applied}
#'   \item{topdressing_fertilizer_grams}{Grams of topdressing fertilizer applied}
#'   \item{know_recommended_tools}{Do you know the recommended cups (cups #5 or #8) for maize?}
#'   \item{reason_no_use_scoop}{Why are you not using them?}
#'   \item{reason_no_use_scoop_other}{Please elaborate.}
#'   \item{would_use_scoop_if_given}{Would you use the fertilizer scoops if they were given to you?}
#'   \item{would_use_scoop_if_available}{Would you buy the fertilizer scoops if available?}
#'   \item{wtp_scoop}{How much would you be willing to pay for the fertilizer scoops?}
#'   \item{selling_points_scoop}{Do you know where the scoops are sold?}
#'   \item{selling_points_scoop_location}{Can you state where?}
#'   \item{know_price_scoop}{Do you know how much it costs in the shop?}
#'   \item{price_scoop}{How much?}
#'   \item{type_seed}{What type of seed do you use?}
#'   \item{n_seeds}{How many seeds do you plant per planting station?}
#'   \item{planting_distance}{Measure how far the planting stations are away from each other.}
#'   \item{ridges_distance}{Measure how far the ridges are away from each other.}
#'   \item{several_plants_emerging}{If multiple plants emerge from the same planting station, select "Yes".}
#'   \item{intercropping}{Do you practice intercropping?}
#'   \item{intercrop_type}{What do you intercrop with?}
#'   \item{intercrop_type_other}{Please specify.}
#'   \item{pesticide_use}{Do you use pesticides?}
#'   \item{fertilizer_subsidy_received}{Were you a beneficiary of fertilizer subsidies this year?}
#'   \item{concern_fertilizer_removed}{How concerned are you about fertilizer subsidies being removed?}
#'   \item{concern_fertilizer_removed_explain}{Please explain.}
#'   \item{fertilizer_programme_effective}{Do you think the fertilizer subsidy programme reaches the people it is meant to?}
#'   \item{fertilizer_programme_improvements}{Do you think the fertilizer subsidy programme could be improved?}
#'   \item{fertilizer_programme_improvements_explain}{Please explain.}
#'   \item{apply_org_fertilizer}{Do you apply organic fertilizers to your fields?}
#'   \item{origin_org_fertilizer}{Where are you getting the organic fertilizer from?}
#'   \item{how_apply_org_fertilizer}{How do you apply it?}
#'   \item{challenges_org_fertilizer}{Do you have any challenges with organic fertilizers?}
#'   \item{type_challenges_org_fertilizer}{What challenges do you have?}
#'   \item{type_challenges_org_fertilizer_other}{Please elaborate.}
#'   \item{sufficient_org_fertilizer}{Do you think organic fertilizers would be sufficient for your fields without any chemical fertilizer?}
#'   \item{subsidies_org_fertilizer}{Should the government subsidise organic fertilizers?}
#'   \item{health_soil_now}{How healthy do you think your soils are?}
#'   \item{health_soil_t10}{How healthy do you think your soils were 10 years ago?}
#'   \item{reasons_changes}{Why do you think so?}
#'   \item{suggestions_soil_improvement}{What do you think should be done to restore/maintain/improve the soil health in your field?}
#'   \item{final_comments}{Do you have anything else you would like to tell us?}
#'   \item{end_message}{Thank you for your time. The survey is now finished. Thank the person for their availability, time and answers. Ask if they have any further questions. This space allows you to report anything that may have been unusual during the survey.}
#'   \item{uuid}{Unique identifier}
#' }
"mwfertiliserpilot"
