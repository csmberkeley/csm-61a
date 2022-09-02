# CSM 61A content workflow

## Pre-composition
Before you write the worksheet, you must review past semester's work (refer to the most recent semesters, `su22`, `sp22`, `fa21`, and go back further if needed)
- Review those previous semester's worksheets. 
    - In some cases, topics were covered on different dates and in different combinations. You'll have to review 
- Review stale branches and unmerged pull requests from previous semesters for possible improvements not reflected in `master`.*
- Review the issues.  

# Note: It is strongly suggested to use Github Desktop for everything Git-related for this repo

## Drafting
- Create a branch to store all of work for the current worksheet.
    - In Git Bash: `git checkout -b fa22/mentor[worksheet #]` (ex. `fa22/mentor02`)
    - In Github Desktop: Click on `Current branch` and select `New branch`
    - There should be a new popup with the button `Publish Branch`, click on that
    - There should be a new popup in the same place with `Create Pull Request`
        - Once you have made some changes you can click on that button and open a pull request of the same name. 
- A general rule to follow: No commit is too small.
    - As you go one and create changes, please commit them along with descriptive commite messages
    - [Example](https://github.com/csmberkeley/csm-61a/commit/b7a4ee059985c6cd8d298d9755f1905cd6a090b3)
- For stying and formatting your questions please refer to STYLE.MD

## Worksheet review
- See WORKSHEET_REVIEW.md. 

## Finalization
- Make the worksheets, and place them in your semester's folder in `src`. 
- Do not delete the branch at this point. 

## Post-section feedback
- Collect feedback from mentors through a Google form.
    - Write a new issue detailing these fixes. For each problem you critique, mention the canonical name of the problem (the name of the question file in `topics`). For example: `funky-funcs`.
    - If you have the bandwidth, you can fix particularly egregious problems at this point. However, under no circumstances should you change the final worksheet PDFs in the semester's folder. We're not here to rewrite history. 
- Close or merge all pull requests used for the worksheet, and then delete the branch. 

## *End of semester
Some previous semesters did not maintain this repository as well as they could have. We're going to do a better job of that. 
- At the end of the semester, all pull requests should be closed or merged, and all branches should be deleted. 