# Exploration of LLMs in Writing and Explaining Policy-Based and Attribute-Based Access Policies Across Varied Languages

This repository includes resources and results collected during a study to evaluate writing and explaining Policy-Based and Attribute-Based access policies using LLMs such as OpenAI ChatGPT and Google Bard.

## Organization

The repository is organized in 3 folders, each representing one of the experiments

- policy_generation: Experiment for Accuracy in Policy Generation, containing the following files and folders
  
  - policy_scenarios.md: Contains a table listing the devised policies for the experiment
  - prompts.md: Contains a table listing the prompts devised for each scenario targeting different language (Rego, XACML, SPDL) and different policy type (ABAC,PBAC) along with a link to prompt result from ChatGPT and Bard.
  - chatgpt: A folder containing prompt code result from ChatGPT for each prompt, the files are names such as "xx.[rego|txt|xml]" where xx is the prompt ID.
  - bard: A folder containing prompt code result from ChatGPT for each prompt, the files are names such as "xx.[rego|txt|xml]" where xx is the prompt ID.
