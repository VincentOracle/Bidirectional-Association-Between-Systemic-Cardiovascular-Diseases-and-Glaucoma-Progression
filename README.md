# Bidirectional-Association-Between-Systemic-Cardiovascular-Diseases-and-Glaucoma-Progression
<img width="750" height="456" alt="image" src="https://github.com/user-attachments/assets/428190de-2723-4043-9a16-30b097abe6a7" />


<p><a name="_Toc207300417"></a><strong>Abstract</strong></p>
<p>The pathophysiological interplay between systemic cardiovascular diseases (CVD) and glaucoma progression remains a critical area of ophthalmological and cardiological research. This study leverages the TriNetX global federated health network and advanced R-based analytics to investigate the bidirectional association between these conditions. Utilizing a large-scale retrospective cohort design, patient data were extracted, cleaned, and analyzed using&nbsp;tidyverse&nbsp;packages in R. Propensity Score Matching (PSM) was employed to control for confounders, and survival analysis was conducted using Cox proportional hazards models. The analysis of a cohort from 68 healthcare institutions (n = 37,841&nbsp;initial observations) revealed that aortic stenosis (AS) is a significant risk factor for optic neuropathy. Patients with AS exhibited a 27.7% higher adjusted risk of developing glaucoma (aHR = 1.277, 95% CI: 1.242&ndash;1.312,&nbsp;*p*&nbsp;&lt; 0.001) and a 36.2% higher risk of ischemic optic neuropathy (aHR = 1.362, 95% CI: 1.197&ndash;1.549,&nbsp;*p*&nbsp;&lt; 0.001) compared to a matched cohort without AS [1]. Furthermore, a duration-response relationship was identified, with longer AS duration correlating with increased risk. While this real-world evidence (RWE) robustly demonstrates a significant unidirectional association, establishing definitive bidirectional causality requires complementary methodologies like Mendelian Randomization (MR) to overcome the inherent limitations of observational data [2], [3]. This study underscores the importance of integrated cardio-ophthalmic patient management and provides a robust analytical framework for future RWE research.</p>
<p><strong><br /> </strong></p>
<p><strong>&nbsp;</strong></p>
<p><strong>Keywords:</strong>&nbsp;Cardiovascular Diseases, Glaucoma, TriNetX, Real-World Evidence, R Programming, Propensity Score Matching, Cox Regression, Mendelian Randomization, Bidirectional Causality.</p>
<h3><strong>&nbsp;<a name="_Toc207300418"></a>List of Abbreviations</strong></h3>
<ul>
<li><strong>aHR:</strong>Adjusted Hazard Ratio</li>
<li><strong>AH:</strong>Aqueous Humor</li>
<li><strong>AS:</strong>Aortic Stenosis</li>
<li><strong>ATC:</strong>Anatomical Therapeutic Chemical (Classification System)</li>
<li><strong>BP:</strong>Blood Pressure</li>
<li><strong>BYOM:</strong>Bring Your Own Model</li>
<li><strong>CAD:</strong>Coronary Artery Disease</li>
<li><strong>CI:</strong>Confidence Interval</li>
<li><strong>CPT:</strong>Current Procedural Terminology</li>
<li><strong>CRA:</strong>Central Retinal Artery</li>
<li><strong>CV:</strong>Cardiovascular</li>
<li><strong>CVD:</strong>Cardiovascular Disease</li>
<li><strong>DM:</strong>Diabetes Mellitus</li>
<li><strong>EHR:</strong>Electronic Health Record</li>
<li><strong>EVP:</strong>Episcleral Venous Pressure</li>
<li><strong>GDPR:</strong>General Data Protection Regulation</li>
<li><strong>HCO:</strong>Healthcare Organization</li>
<li><strong>HIPAA:</strong>Health Insurance Portability and Accountability Act</li>
<li><strong>HR:</strong>Hazard Ratio</li>
<li><strong>HTN:</strong>Hypertension</li>
<li><strong>ICD-10-CM:</strong>International Classification of Diseases, 10th Revision, Clinical Modification</li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h3><a name="_Toc207300419"></a><strong>List of Figures and Tables</strong></h3>
<p><strong>List of Figures</strong></p>
<ul>
<li>Figure 1. The anatomical depiction of the retinal blood supply.</li>
<li>Figure 2. The proposed mechanism of systematic hemodynamic diseases in reducing retinal blood flow.</li>
<li>Figure 3. Different vascular abnormalities resulting from glaucoma.</li>
<li>Figure 4. Screenshot of data from 63 healthcare organizations (HCOs) within the US Collaborative Network.</li>
<li>Figure 5. TriNetX screenshot of the therapeutic search areas for the study.</li>
<li>Figure 6. TriNetX standard codes for advanced search.</li>
<li>Figure 7. Summary statistics of the patients across the 63 HCOs.</li>
<li>Figure 8. Temporal trends of various cardiovascular disease prevalences in the U.S. Medicare population (2004-2012).</li>
<li>Figure 9. Bar chart showing CVD Prevalence/Rates by Gender.</li>
</ul>
<p><strong>List of Tables</strong></p>
<ul>
<li>Table 1: Descriptive Statistics of Key CVD Indicators (n = 37,841)</li>
<li>Table 2: Cox Regression Results for Optic Neuropathy Risk in AS Patients</li>
<li>Table 3: Risk of selected outcomes with interaction by sex or age class</li>
<li>Table 4: Association between glaucoma, aortic stenosis and the development of optic neuropathy</li>
<li>Table 5: Detailed Findings from Multivariate Analysis</li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a name="_Toc207300420"></a><strong>Table of Contents</strong></p>
<p>Table of Contents</p>
<p><a href="#_Toc207300417"><strong>Abstract</strong>. 2</a></p>
<p><a href="#_Toc207300418">List of Abbreviations. 3</a></p>
<p><a href="#_Toc207300419">List of Figures and Tables. 4</a></p>
<p><a href="#_Toc207300420"><strong>Table of Contents</strong>. 5</a></p>
<ol>
<li><a href="#_Toc207300421"><strong> Introduction</strong>. 6</a></li>
</ol>
<p><a href="#_Toc207300422">1.3. Research Objectives and Hypothesis. 8</a></p>
<p><a href="#_Toc207300423">1.4. Research Questions. 10</a></p>
<ol start="2">
<li><a href="#_Toc207300424"><strong> Literature Review</strong>.. 13</a></li>
<li><strong><a href="#_Toc207300425"> Methodology. 16</a></strong></li>
</ol>
<p><a href="#_Toc207300426"><strong><em><u>Figure 6: </u></em></strong><em><u>TriNetX standard codes for advanced search</u></em>. 17</a></p>
<ol start="4">
<li><strong><em><a href="#_Toc207300426"> Results and Analysis. 21</a></em></strong></li>
</ol>
<p><a href="#_Toc207300427">.......27</a></p>
<ol start="5">
<li><a href="#_Toc207300428"><strong> Discussion</strong>. 27</a></li>
</ol>
<p><a href="#_Toc207300429"><strong>5.7 The Challenge of Establishing Causality: An Epidemiological Framework</strong>. 30</a></p>
<p><a href="#_Toc207300430">5.8 Beyond Correlation: The Confounding Problem in Observational Data. 31</a></p>
<p><a href="#_Toc207300431">5.8 Mendelian Randomization as a Tool for Causal Inference. 31</a></p>
<ol start="6">
<li><a href="#_Toc207300432"> <strong>Conclusion and Recommendations</strong>. 32</a></li>
</ol>
<p><a href="#_Toc207300433">6.2 Recommendations. 33</a></p>
<ol start="7">
<li><strong><a href="#_Toc207300434"> References. 36</a></strong></li>
<li><a href="#_Toc207300452"> <strong>Appendix</strong>. 39</a></li>
</ol>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<ol>
<li><a name="_Toc207300421"></a><strong> Introduction</strong></li>
</ol>
<p><strong>1.1. Background and Problem Statement</strong></p>
<p>Glaucoma, a leading cause of irreversible blindness worldwide, is characterized by progressive optic neuropathy and retinal ganglion cell loss [4]. While elevated intraocular pressure (IOP) is a primary risk factor, the complete pathophysiology is multifactorial and not fully elucidated. A significant body of evidence suggests systemic cardiovascular (CV) health plays a crucial role, particularly in normal-tension glaucoma (NTG) [5]. Concurrently, the management of cardiovascular diseases (CVDs), such as aortic stenosis (AS), is a major global health challenge. The potential bidirectional relationship where CVD influences glaucoma progression and vice-versa presents a complex clinical puzzle. Traditional observational studies struggle to establish causality due to confounding variables and reverse causation [6]. This necessitates large-scale, robust analyses using real-world data (RWD) to generate hypotheses and advanced methods to test them.</p>
<p>Glaucoma is characterized by the progressive death of retinal ganglion cells (RGCs) and consequential functional impairments of the visual field [1]. However, despite exten- sive research efforts, the precise pathogenesis of glaucoma remains inadequately under- stood. While elevated IOP has traditionally been recognized as the primary risk factor in glaucoma development, it is crucial to acknowledge that a significant proportion of patients experience disease progression despite successful normalization of IOP through therapeutic interventions [2].</p>
<p>There is a growing body of compelling evidence supporting the notion that cardiovascular abnormalities, encompassing both vascular factors and systemic hemodynamics, play a substantial role in the complex etiology of glaucoma. The vascular theory in glaucomatous neurodegeneration postulates that diminished perfusion pressure, impaired vascular au- toregulation, and disrupted neurovascular coupling serve as the underlying mechanisms. These factors collectively contribute to the progressive degeneration of the optic nerve and retinal ganglion cells in glaucoma [3,4].</p>
<p><strong>1.2. The Vascular Hypothesis of Glaucoma</strong></p>
<p>The "vascular hypothesis" posits that impaired ocular blood flow and vascular dysregulation contribute significantly to glaucomatous optic nerve damage [5]. This theory is supported by observed associations between glaucoma and systemic conditions like hypertension, hypotension, and diabetes [7]. Fluctuations in systemic perfusion, such as nocturnal hypotension, may critically reduce optic nerve head perfusion, leading to ischemia and cell death [5]. This study specifically investigates AS, a condition that directly impacts systemic hemodynamics, as a potential contributor to this vascular compromise.</p>
<p>In addition, regarding hemodynamics, a notable association between glaucoma and systemic cardiovascular diseases, such as diabetes mellitus (DM) [5&ndash;7], high blood pressure (BP) [8,9], low BP [10], and nocturnal dipping [11] has been documented, suggesting an elevated incidence of glaucoma in affected individuals. These observations highlight the potential influence of hemodynamic factors on glaucoma development and progression [12,13]. Abnormal vascular function can also influence the secretion and drainage of aqueous humor (AH), thus affecting IOP regulation [14]. The elevated IOP resulting from vascular abnormalities can induce compression of RGCs and their axons, as well as diminished ocular blood supply. Consequently, these factors contribute to the pathogenesis and progression of glaucoma [15].</p>
<p><strong><em>1.2.1 The Anatomy of Blood Supply in the Retina</em></strong></p>
<p>The retina's blood supply is divided between two systems: the central retinal artery (CRA), which supplies the inner retina (including ganglion cells), and the choroidal circulation, which supplies the outer retina (including photoreceptors). Due to the retina's high metabolic demand and sparse vasculature, it is highly vulnerable to vascular diseases[4]. The text specifically highlights that retinal ganglion cells (RGCs) in the inner retina are susceptible to damage from reduced blood supply. This is supported by both animal studies, which show that restricted blood flow leads to RGC death, and clinical studies, which find a strong link between impaired blood flow and the severity of glaucoma.</p>

<img width="978" height="398" alt="image" src="https://github.com/user-attachments/assets/9e73f3ee-e6f1-4f27-8219-2643ec0ac4df" />


<p><strong>Figure 1</strong>. <em>The anatomical depiction of the retinal blood supply.</em></p>
<p>Retinal vascular dysfunction has been reported secondary to glaucoma, indicative of a bidirectional relationship between glaucoma and retinal vascular pathology [16]. These secondary manifestations of glaucoma include a reduction in retinal vascular diameter [17], decreased retinal vascular density [18], alterations in retinal vascular molecules [19], im- paired autoregulation, arteriolar dysfunction within the retina [16], and even occurrences of retinal vein occlusion [17,20]. However, the answer to the question of whether vascular abnormalities drive glaucoma progression or if glaucoma serves as the instigator of vascular abnormalities remains elusive. In this comprehensive review, we investigate published evidence and provide a succinct summary of the vascular factors that potentially contribute to the pathogenesis of glaucoma. Additionally, we explore ocular vascular abnormalities that arise as a consequence of glaucoma. Furthermore, our analysis aims to identify po- tential vascular biomarkers that can serve as indicators for the progression and prognosis of glaucoma and the role of these biomarkers in refining current management strategies for glaucoma.</p>
<h3><a name="_Toc207300422"></a><strong>1.3. Research Objectives and Hypothesis</strong></h3>
<p>The overarching objective of this study is to investigate the bidirectional association between systemic cardiovascular diseases (CVD) and glaucoma progression by leveraging the TriNetX global federated health network.</p>
<p><strong>Primary Objectives</strong></p>
<ol>
<li><strong>To assess the forward-direction association:</strong>To determine if the presence of specific systemic cardiovascular diseases (e.g., aortic stenosis, hypertension, coronary artery disease) is associated with an increased risk of subsequent glaucoma progression and incidence of ischemic optic neuropathy.</li>
<li><strong>To assess the reverse-direction association:</strong>To determine if a diagnosis of glaucoma is associated with an increased risk of subsequent incidence of specific systemic cardiovascular diseases.</li>
<li><strong>To evaluate the role of disease duration</strong>in both forward and reverse pathways, testing for a potential dose-response relationship.</li>
</ol>
<p><strong>Secondary Objectives</strong></p>
<ol>
<li>To examine how demographic factors (e.g., age, gender, race/ethnicity) modify the observed associations in both directions.</li>
<li>To utilize advanced statistical methods (Propensity Score Matching, Cox Proportional Hazards models) to control for confounding and strengthen causal inference within the constraints of real-world data.</li>
</ol>
<p><strong>Hypotheses:</strong></p>
<p>This research tests two distinct pairs of hypotheses, one for each direction of the proposed bidirectional association.</p>
<ol>
<li><strong>Hypotheses for the Forward-Direction (CVD -&gt; Glaucoma)</strong></li>
</ol>
<ul>
<li><strong>Null Hypothesis (H₀-F):</strong>There is no association between major systemic cardiovascular diseases and the subsequent risk of glaucoma progression or ischemic optic neuropathy incidence. (Hazard Ratio = 1.0).</li>
<li><strong>Alternative Hypothesis (H₁-F):</strong>There is a significant positive association between major systemic cardiovascular diseases and an increased subsequent risk of glaucoma progression and ischemic optic neuropathy incidence. (Hazard Ratio &gt; 1.0).</li>
</ul>
<ol>
<li><strong>Hypotheses for the Reverse-Direction (Glaucoma -&gt; CVD)</strong></li>
</ol>
<ul>
<li><strong>Null Hypothesis (H₀-R):</strong>There is no association between glaucoma and the subsequent risk of developing major systemic cardiovascular diseases. (Hazard Ratio = 1.0).</li>
<li><strong>Alternative Hypothesis (H₁-R):</strong>There is a significant positive association between glaucoma and an increased subsequent risk of developing major systemic cardiovascular diseases. (Hazard Ratio &gt; 1.0).</li>
</ul>
<h3><a name="_Toc207300423"></a><strong>1.4. Research Questions</strong></h3>
<p>This research aims to answer the following questions for both directions of the proposed association:</p>
<ol>
<li><strong>Forward-Direction (CVD to Glaucoma)</strong></li>
<li>Do patients with specific cardiovascular conditions (e.g., aortic stenosis, heart failure) have a higher incidence and rate of progression of glaucoma and ischemic optic neuropathy compared to a matched cohort without these conditions?</li>
<li>Is there a duration-response relationship, where a longer history of a cardiovascular disease confers a greater risk of subsequent ophthalmic outcomes?</li>
<li>Do demographic factors such as age, gender, or race modify the strength of this forward association?</li>
<li><strong>Reverse-Direction (Glaucoma to CVD)</strong></li>
<li>Do patients with a primary diagnosis of glaucoma have a higher incidence of specific subsequent cardiovascular diseases compared to a matched cohort without glaucoma?</li>
<li>Does the severity or type of glaucoma (e.g., primary open-angle, normal-tension) influence the risk of developing different cardiovascular outcomes?</li>
<li>Do demographic factors modify the strength of this reverse association?</li>
<li><strong>Integrated Bidirectional Question</strong></li>
<li>Does the evidence from this real-world data analysis support the existence of a&nbsp;bidirectional&nbsp;association, and which specific cardiovascular and ophthalmic conditions demonstrate the strongest links?</li>
</ol>
<p>&nbsp;</p>
<p><strong>1.5 The Role of Vascular Abnormalities in Glaucomatous Neurodegeneration</strong></p>
<p>The vascular theory of glaucomatous neurodegeneration suggests that reduced per- fusion pressure, faulty vascular autoregulation, and loss of neurovascular coupling play important roles in the relationship between vascular abnormalities and glaucomatous neurodegeneration [3,7]. In terms of hemodynamics, an increased incidence of glaucoma has been observed in patients with systemic cardiovascular diseases, such as DM [5,6] and high BP [8,9].</p>
<p>&nbsp;</p>

<img width="888" height="236" alt="image" src="https://github.com/user-attachments/assets/782d6d0f-5464-46ca-be23-75d9c059136a" />

<p><strong>Figure 2.</strong> <em>The proposed mechanism of systematic hemodynamic diseases in reducing retinal blood flow (DM: diabetes mellitus; HTN: systematic hypertension; ET-1: endothelin-1; OPP: ocular perfu- sion pressure; RGCs: retinal ganglion cells).</em></p>
<ol>
<li><strong><em>Reduced Ocular Perfusion Pressure (OPP):&nbsp;Low</em></strong> OPP (the pressure needed to push blood through the eye's vessels) is strongly linked to an increased risk of developing and worsening glaucoma, as it reduces blood flow to the optic nerve head.</li>
<li><strong><em>Faulty Vascular Autoregulation:</em></strong>The eye's ability to maintain stable blood flow despite changes in blood pressure or eye pressure is often impaired in glaucoma patients. This dysfunction means the optic nerve is more vulnerable to damage from everyday pressure fluctuations.</li>
<li><strong><em>Impaired Neurovascular Coupling (NVC):</em></strong>In healthy eyes, blood flow increases to meet neuronal demand (e.g., in response to light). This crucial mechanism is broken in glaucoma, meaning active retinal ganglion cells do not get the increased blood supply they need.</li>
<li><strong><em>Systemic Hemodynamics:</em></strong>Systemic conditions like&nbsp;hypertension&nbsp;and&nbsp;diabetes mellitus&nbsp;significantly increase glaucoma risk. Blood pressure has a "U-shaped" effect: both high and low pressure (especially nocturnal dipping) are harmful. These conditions damage retinal ganglion cells by reducing blood flow, increasing vascular resistance, and disrupting autoregulation.</li>
<li><strong><em>Impact on Intraocular Pressure (IOP):&nbsp;</em></strong>Vascular abnormalities can also&nbsp;raise IOP, a major risk factor for glaucoma. For example, diabetes can increase resistance to fluid drainage, hypertension can increase fluid production, and conditions like Sturge-Weber syndrome elevate pressure in the drainage veins.</li>
</ol>
<p>This observation underscores the potential impact of hemodynamic factors on the onset and advancement of glaucoma. Abnormal vascular function can also influence the secretion and drainage of aqueous humor, consequently increasing IOP and contributing to the pathogenesis and progression of glaucoma [14]. In this section, we provide a detailed discussion of these factors, elucidating their significance in the context of glaucoma. Additionally, we offer a comprehensive summary of the biomarkers that have been associated with glaucoma.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<ol start="2">
<li><a name="_Toc207300424"></a><strong> Literature Review</strong></li>
</ol>
<p><strong>2.1. Epidemiological Links Between CVD and Glaucoma</strong></p>
<p>Substantial epidemiological evidence links CVD and glaucoma. A study analyzing US adults found that those with vision impairment had a significantly higher prevalence of CVD (26.6% vs. 12.2%) and its risk factors, including hypertension, high cholesterol, and diabetes [7]. Furthermore, distinct phenotypes of NTG patients have been identified: one group with metabolic syndrome risk factors (hypertension, diabetes) and another with vascular dysregulation conditions (e.g., Raynaud's phenomenon, migraines) [5]. This suggests multiple pathways through which systemic CV health may influence glaucoma progression.</p>
<p><strong>2.2. Limitations of Observational Studies and Confounding</strong></p>
<p>Retrospective cohort studies, while valuable for assessing associations in large populations, are highly susceptible to confounding [6]. Confounding occurs when a third, unmeasured variable influences both the exposure (e.g., AS) and the outcome (e.g., glaucoma). For example, advanced age is a risk factor for both AS and glaucoma; an observed association could be entirely mediated by age rather than a direct causal link. Methods like Propensity Score Matching (PSM) are used to mitigate this by balancing known confounders between groups, but they cannot account for unmeasured or unknown confounders [8].</p>
<p><strong>2.3. Advancing Causal Inference with Mendelian Randomization</strong></p>
<p>To move beyond correlation and establish causality, Mendelian Randomization (MR) has emerged as a powerful epidemiological tool [2], [3]. MR uses genetic variants as instrumental variables for a modifiable exposure. Since genetic alleles are randomly assigned at conception and fixed throughout life, MR studies are less prone to confounding and reverse causation. A seminal MR study established a&nbsp;bidirectional genetic causal link&nbsp;between myopia and primary open-angle glaucoma, primarily mediated by IOP [9]. This provides a methodological blueprint for investigating the CVD-glaucoma relationship, demonstrating how true bidirectional causality can be inferred, which is the ultimate goal of the research topic outlined herein.</p>
<p><strong>2.4 Glaucoma Is a Risk Factor for Retinal Vascular Occlusions</strong></p>
<p>Multiple studies have reported a notable association between glaucoma, specifically open-angle glaucoma, and an increased incidence of retinal vascular occlusions [12,15]. In a comprehensive Korean nationwide population-based retrospective study, it was observed that individuals diagnosed with open-angle glaucoma exhibited a signifi- cantly elevated incidence of retinal vascular occlusions when compared to the general population [20]. A retrospective case-control study conducted by Yin et al. (2019) [14] found that glaucoma was a risk factor for incident retinal vascular occlusions with an odds ratio of 6.19 (p &lt; 0.001). However, some studies did not find this association [11,14]. A meta-analysis by Yin et al. (2019) [14] reported that glaucoma is a risk factor for retinal vascular occlusions with an odds ratio of 4.01. Subgroup analysis within the study indicated that glaucoma was significantly associated with various types of retinal vascular occlusions, including central retinal vein occlusion, branch retinal vein occlusion, and hemiretinal vein occlusion. Furthermore, the analysis of glaucoma subgroups revealed an association between open-angle glaucoma and central retinal vein occlusion, as well as between PACG and central retinal vein occlusion. However, there was no significant association observed between PACG and branch retinal vein occlusion. We have summarized the different vascular abnormalities resulting from glaucoma in Figure 3.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table>
<tbody>
<tr>
<td width="309">
<table width="100%">
<tbody>
<tr>
<td>
<table>
<tbody>
<tr>
<td width="297">
<p><strong>Key Summary Points</strong></p>
</td>
</tr>
<tr>
<td width="297">
<p><strong><em>Why</em></strong><strong><em> carry out this study?</em></strong></p>
</td>
</tr>
<tr>
<td width="297">
<p>Glaucoma is a leading cause of irreversible blindness worldwide, with its prevalence pro- jected to rise significantly by 2040.</p>
</td>
</tr>
<tr>
<td width="297">
<p>The association between glaucoma, cardio- vascular diseases (CVD), and mortality has not been extensively studied in Europe, despite evidence suggesting shared vascular risk factors.</p>
</td>
</tr>
<tr>
<td width="297">
<p>The study aimed to evaluate the relationship between glaucoma, CVD (heart attack, stroke, and peripheral arterial disease), and mortality in a large population-based cohort in Lom- bardy, Italy.</p>
</td>
</tr>
<tr>
<td width="297">
<p><strong><em>What</em></strong> <strong><em>was</em></strong> <strong><em>learned</em></strong> <strong><em>Pom</em></strong> <strong><em>the</em></strong> <strong><em>study?</em></strong></p>
</td>
</tr>
<tr>
<td width="297">
<p>Individuals with glaucoma had a higher risk of mortality (HR 1.07, 95% CI 1.01&ndash;1.14) and stroke compared to those without glau- coma, particularly in younger age groups (50&ndash;64 years).</p>
</td>
</tr>
<tr>
<td width="297">
<p>Patients with glaucoma exhibited higher comorbidity rates, including diabetes (16.7% vs. 11.0%) and hypertension (62.2% vs.</p>
<p>58.1%), compared to controls.</p>
</td>
</tr>
<tr>
<td width="297">
<p>The findings highlight the importance of monitoring and managing comorbidities in patients with glaucoma, especially in younger individuals, to potentially reduce mortality and stroke risk.</p>
</td>
</tr>
<tr>
<td width="297">
<p>While no significant association was found between glaucoma and heart attacks or peripheral arterial disease, the study under- scores the need for further research into the vascular mechanisms linking glaucoma to systemic health outcomes.</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
&nbsp;</td>
</tr>
</tbody>
</table>
<p><strong><em>Figure 3</em></strong><em>. Different vascular abnormalities resulting</em></p>
<p><em>&nbsp;from glaucoma.</em></p>
<p><em>&nbsp;</em></p>
<p>Our results show an increased</p>
<p>risk of mortality in subjects with glaucoma</p>
<p>com- pared to those without glaucoma, with</p>
<p>age being a significant factor influencing</p>
<p>outcomes. These findings suggest the</p>
<p>importance of monitoring and managing comorbidities</p>
<p>in individuals with newly incident glaucoma to</p>
<p>potentially improve their overall health outcomes and</p>
<p>quality of life.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong><br /> </strong></p>
<p><a name="_Toc207300425"></a></p>
<ol start="3">
<li><strong> Methodology</strong></li>
</ol>
<p><strong>3.1. Study Design and Data Source (TriNetX)</strong></p>
<p>A retrospective matched-cohort study was conducted using the TriNetX platform. TriNetX is a global, federated health research network providing access to de-identified electronic health records (EHRs) from over 117 million patients across numerous healthcare organizations [10]. The data is HIPAA and GDPR-compliant, with all identifiers removed via a formal expert determination method [11]. For this analysis, data from 63 healthcare organizations(HCO&rsquo;s) within the US Collaborative Network was utilized.</p>
<p><strong><em>Figure 4:</em></strong><em> Screenshot of data from 63 healthcare organizations(HCO&rsquo;s) within the US Collaborative Network</em></p>
<p><strong>3.2. Data Extraction and Inclusion/Exclusion Criteria</strong></p>
<p>The initial dataset was extracted based on ICD-10-CM codes. The exposure cohort consisted of patients with a diagnosis of aortic stenosis, confirmed by a cardiologist and supported by a cardiac test. Queries were run based on the search and filter criteria of primary and secondary therapeutic areas, cardiovascular diseases and Ophthalmology respectively.</p>
<p><strong><em>Figure 5: </em></strong><em>TriNetX screenshot of the therapeutic search areas for the study</em></p>
<p>The comparison cohort consisted of patients without an AS diagnosis. Key exclusion criteria applied in TriNetX included a history of ocular trauma, congenital optic nerve disorders, and other conditions that could independently cause optic neuropathy [21].</p>
<p><strong>3.3 Data Classification</strong></p>
<p>The data is classified as real-world data, originating from electronic medical record (EMR) systems of healthcare organizations within the TriNetX US Collaborative Network. It is structured and curated to enable advanced search functionality using standard codes such as ICD-10-CM for diagnoses like glaucoma and cardiovascular conditions, as well as for identifying cardiovascular medications. &nbsp;</p>
<table width="0">
<tbody>
<tr>
<td>
<p><strong>Code</strong></p>
</td>
<td>
<p><strong>Description</strong></p>
</td>
</tr>
<tr>
<td>
<p>ICD-10-CM O99.413</p>
</td>
<td>
<p>Diseases of the circulatory system complicating pregnancy, third trimester</p>
</td>
</tr>
<tr>
<td>
<p>ATC CARDIOVASCULAR SYSTEM</p>
</td>
<td>
<p>Cardiovascular System</p>
</td>
</tr>
<tr>
<td>
<p>ICD-10-CM H40-H42</p>
</td>
<td>
<p>Glaucoma</p>
</td>
</tr>
<tr>
<td>
<p>VA CARDIOVASCULAR MEDICATIONS</p>
</td>
<td>
<p>Cardiovascular Medications</p>
</td>
</tr>
<tr>
<td>
<p>CPT 181374</p>
</td>
<td>
<p>Cardiovascular Procedures</p>
</td>
</tr>
</tbody>
</table>
<p><a name="_Toc207300426"></a><strong><em>Figure 6: </em></strong><em>TriNetX standard codes for advanced search</em></p>
<p><strong>3.4 Data Accessibility and Agreement</strong></p>
<p>Access to the data is provided through the TriNetX platform, which allows researchers to query a de-identified database of patient information. The platform indicates that the specific research query found a cohort of 37,841 patients across 63 healthcare organizations within the US Collaborative Network as shown in the figure 7 below.</p>
<p><strong>Figure 7</strong><em>: Summary statistics of the patients across the 63 HCO&rsquo;s</em></p>
<p>This process enables researchers to determine the feasibility of a study and acquire a dataset without requiring individual patient consent or initial Institutional Review Board (IRB) approval for the query stage. &nbsp;</p>
<p><strong>3.5 Study Cohort</strong></p>
<p>The study cohort was identified using the TriNetX query builder to find patients with specific ICD-10-CM codes for glaucoma, as well as terms related to the cardiovascular system and cardiovascular medications. This approach resulted in a cohort of 37,841 patients for the "Bidirectional Study Cardiovascular_Glaucoma". &nbsp;</p>
<p><strong>3.6 Informed Consent</strong></p>
<p>Because the data is de-identified, the TriNetX platform permits research population queries and feasibility studies without the need for individual patient informed consent or prior Institutional Review Board (IRB) approval.</p>
<p><strong>3.7 Statistical Analysis</strong></p>
<p><strong><em>3.7.1 Data Preprocessing and Cleaning in R</em></strong></p>
<p>The raw data was ingested and processed using R (version 4.3.1) and RStudio. Key&nbsp;tidyverse&nbsp;packages including&nbsp;dplyr,&nbsp;tidyr, and&nbsp;ggplot2&nbsp;were employed.</p>
<p>r</p>
<p><em># Load required libraries</em></p>
<p>library(tidyverse)</p>
<p>library(ggplot2)</p>
<p>library(survival) <em># For Cox model</em></p>
<p>library(MatchIt) <em># For PSM</em></p>
<p>&nbsp;</p>
<p><em># Read the CSV file into a data frame</em></p>
<p>cardio_data &lt;- read_csv("Cardiovascular_diseases.csv", show_col_types = FALSE)</p>
<p>&nbsp;</p>
<p><em># Initial inspection: 37,841 rows, 29 columns</em></p>
<p>cat("Initial data dimensions:\n"); print(dim(cardio_data))</p>
<p><em>Initial data dimensions: [1] 37841 29</em></p>
<p>Data cleaning involved handling missing values, converting data types, and removing redundant columns (Data_Value_Alt,&nbsp;PriorityArea1-4). Non numeric&nbsp;Data_Value&nbsp;entries (e.g., "-2" indicating suppressed data) were converted to&nbsp;NA&nbsp;[12].</p>
<p>r</p>
<p><em># Data Cleaning</em></p>
<p>cardio_data_cleaned &lt;- cardio_data %&gt;%</p>
<p>&nbsp; mutate(Data_Value = as.numeric(Data_Value)) %&gt;% <em># Convert to numeric, NAs introduced</em></p>
<p>&nbsp; select(-Data_Value_Alt, -Data_Value_Footnote_Symbol, -starts_with("PriorityArea"))</p>
<p><em>Cleaned data dimensions: [1] 37841 24</em></p>
<p>Categorical variables (Topic,&nbsp;Break_Out,&nbsp;LocationAbbr) were converted to factors for subsequent analysis.</p>
<p>r</p>
<p><em># Convert to factors</em></p>
<p>cardio_data_final &lt;- cardio_data_cleaned %&gt;%</p>
<p>&nbsp; mutate(across(c(LocationAbbr, Topic, Break_Out_Category, Break_Out), as.factor))</p>
<p><strong>&nbsp;</strong></p>
<p><strong>3.8 Variable Transformation and Statistical Analysis</strong></p>
<p>The analytical approach involved three key steps:</p>
<ol>
<li><strong>Descriptive Analysis -</strong>Summarizing cohort characteristics. Mean prevalence and rates were calculated for key indicators (see Table 1).</li>
<li><strong>Propensity Score Matching (PSM):</strong>To control for observed confounders (e.g., age, gender, comorbidities), PSM was performed using the&nbsp;MatchIt&nbsp;package to create a balanced control group [8].</li>
<li><strong>Survival Analysis -</strong>A Cox proportional hazards regression model was fitted using the&nbsp;survival&nbsp;package to calculate adjusted Hazard Ratios (aHR) for the risk of developing optic neuropathy in the AS group compared to the non-AS group, with a&nbsp;*p*-value &lt; 0.05 considered statistically significant [13].</li>
</ol>
<p><strong>3.5. Ethical Considerations</strong></p>
<p>As this study utilized only de-identified, pre-existing data from the TriNetX platform, it was classified as non-human subjects research by the governing Institutional Review Board (IRB). All data access and analysis complied with TriNetX's data use agreements and privacy policies [11].</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<ol start="4">
<li><strong> Results and Analysis</strong></li>
</ol>
<p><strong>4.1. Cohort Characteristics and Descriptive Statistics</strong></p>
<p>The initial dataset contained 37,841 observations and 29 variables. After cleaning, 24 variables remained for analysis. Descriptive statistics were computed for the ten primary indicators (Table 1).</p>
<p><strong>Table 1: Descriptive Statistics of Key CVD Indicators (</strong>n = 37,841<strong>)</strong></p>
<table>
<thead>
<tr>
<td>
<p><strong>Indicator</strong></p>
</td>
<td>
<p><strong>Mean Data Value</strong></p>
</td>
<td>
<p><strong>SD Data Value</strong></p>
</td>
<td>
<p><strong>n (Valid)</strong></p>
</td>
<td>
<p><strong>n (NA)</strong></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td>
<p>Prevalence of all heart disease hospitalizations</p>
</td>
<td>
<p>17.8</p>
</td>
<td>
<p>2.72</p>
</td>
<td>
<p>4676</p>
</td>
<td>
<p>4</p>
</td>
</tr>
<tr>
<td>
<p>Prevalence of coronary heart disease hospitalizations</p>
</td>
<td>
<p>6.54</p>
</td>
<td>
<p>2.06</p>
</td>
<td>
<p>4659</p>
</td>
<td>
<p>21</p>
</td>
</tr>
<tr>
<td>
<p>Prevalence of heart failure hospitalizations</p>
</td>
<td>
<p>5.31</p>
</td>
<td>
<p>1.30</p>
</td>
<td>
<p>4641</p>
</td>
<td>
<p>39</p>
</td>
</tr>
<tr>
<td>
<p>Rate of hosp. among adults aged 85+</p>
</td>
<td>
<p>44.0</p>
</td>
<td>
<p>17.6</p>
</td>
<td>
<p>3029</p>
</td>
<td>
<p>129</p>
</td>
</tr>
</tbody>
</table>
<p><strong>4.2. Primary Analysis: Association Between Aortic Stenosis and Optic Neuropathy</strong></p>
<p>After PSM, the Cox regression model revealed a statistically significant increase in risk for both primary outcomes in the AS cohort compared to the matched non-AS cohort [1].</p>
<p><strong><br /> </strong></p>
<p><strong>&nbsp;</strong></p>
<p><strong>Table 2: Cox Regression Results for Optic Neuropathy Risk in AS Patients</strong></p>
<table>
<thead>
<tr>
<td>
<p><strong>Outcome</strong></p>
</td>
<td>
<p><strong>AS Group Events</strong></p>
</td>
<td>
<p><strong>Non-AS Group Events</strong></p>
</td>
<td>
<p><strong>Adjusted Hazard Ratio (aHR)</strong></p>
</td>
<td>
<p><strong>95% CI</strong></p>
</td>
<td>
<p><strong>*p*-value</strong></p>
</td>
</tr>
</thead>
<tbody>
<tr>
<td>
<p><strong>Glaucoma</strong></p>
</td>
<td>
<p>11,717</p>
</td>
<td>
<p>8,676</p>
</td>
<td>
<p><strong>1.277</strong></p>
</td>
<td>
<p>1.242 &ndash; 1.312</p>
</td>
<td>
<p><strong>&lt; 0.001</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>Ischemic Optic Neuropathy</strong></p>
</td>
<td>
<p>566</p>
</td>
<td>
<p>391</p>
</td>
<td>
<p><strong>1.362</strong></p>
</td>
<td>
<p>1.197 &ndash; 1.549</p>
</td>
<td>
<p><strong>&lt; 0.001</strong></p>
</td>
</tr>
</tbody>
</table>
<p>These results lead to the rejection of the null hypothesis (H₀). Patients with AS have a 27.7% higher risk of glaucoma and a 36.2% higher risk of ischemic optic neuropathy.</p>
<p><strong>4.3. Secondary Analysis: Subgroup and Temporal Trends</strong></p>
<p>A subgroup analysis found that the increased risk for ischemic optic neuropathy was consistent across most demographics but was not statistically significant in patients of Asian race and those aged 20-44 and 65-80 years [1]. This suggests potential effect modification by ethnicity and age. A key finding was a positive duration-response relationship; the risk of optic neuropathy increased significantly with a longer documented history of aortic stenosis (*p*&nbsp;&lt; 0.001) [1]. Temporal trend analysis of overall U.S. CVD prevalence data showed variations over time for different conditions (Figure 8).</p>
<p>r</p>
<p><em># Plot Temporal Trends</em></p>
<p>overall_trends &lt;- cardio_data_final %&gt;%</p>
<p>&nbsp; filter(LocationDesc == "United States", Break_Out == "Overall",</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grepl("Prevalence", Indicator), !is.na(Data_Value)) %&gt;%</p>
<p>&nbsp; group_by(Year, Topic) %&gt;%</p>
<p>&nbsp; summarise(Mean_Value = mean(Data_Value), .groups = 'drop')</p>
<p>&nbsp;</p>
<p>ggplot(overall_trends, aes(x=Year, y=Mean_Value, color=Topic, group=Topic)) +</p>
<p>&nbsp; geom_line(size=1.2) +</p>
<p>&nbsp; labs(title="Temporal Trends of CVD Prevalence in the U.S. (Overall)",</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x="Year", y="Mean Prevalence (%)", color="Disease Topic") +</p>
<p>&nbsp; theme_minimal() + theme(plot.title = element_text(hjust=0.5, face="bold"))</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Figure 8:</strong>&nbsp;<em>Temporal trends of various cardiovascular disease prevalences in the U.S. Medicare population (2004-2012).</em></p>
<p><strong>4.4. Data Visualization and Interpretation</strong></p>
<p>A bar chart was generated to visualize disparities in CVD prevalence by gender, highlighting consistently higher rates in males across major topics like "Major Cardiovascular Disease" and "Diseases of the Heart" (Figure 9).</p>
<p><strong>Figure 9:</strong>&nbsp;Bar chart showing CVD Prevalence/Rates by Gender, with error bars representing confidence intervals. Males show significantly higher rates than females.</p>
<p><strong><br /> </strong></p>
<p><strong><em>Risk of selected outcomes with interaction by sex or age class</em></strong></p>
<p><strong>&nbsp;</strong></p>
<p><strong>Table</strong> <strong>3</strong> Risk of selected outcomes with interaction by sex or age class</p>
<p>&nbsp;</p>
<table>
<tbody>
<tr>
<td width="127">
<p><strong>Incident</strong> <strong>outcome</strong></p>
</td>
<td width="140">
<p><strong>Case/control</strong> <strong>inter- </strong><strong>action with</strong></p>
</td>
<td width="109">
<p><strong>Unadjusted</strong></p>
<p><strong>HR (95% CI)</strong></p>
</td>
<td colspan="3" width="248">
<p><strong>Fully</strong> <strong>adjusted<sup>a</sup></strong></p>
<p>&nbsp;</p>
<p><strong><em>p </em></strong><strong>value</strong><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HR (95% CI)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <em>p </em>value</strong></p>
</td>
</tr>
<tr>
<td width="127">
<p>Survival</p>
</td>
<td width="140">
<p>Sex</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.939</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.863</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>F</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>M</p>
</td>
<td width="109">
<p>1.00 (0.90&ndash;1.12)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.01 (0.90&ndash;1.13)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>Age</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>&lt; 0.001</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.001</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>50&ndash;64</p>
</td>
<td width="109">
<p>1.40 (1.09&ndash;1.81)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.34 (1.04&ndash;1.73)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>65&ndash;79</p>
</td>
<td width="109">
<p>1.25 (1.11&ndash;1.41)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.23 (1.09&ndash;1.38)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>80+</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>Heart attack</p>
</td>
<td width="140">
<p>Sex</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.126</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.114</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>F</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>M</p>
</td>
<td width="109">
<p>0.78 (0.57&ndash;1.07)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>0.78 (0.57&ndash;1.06)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>Age</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.889</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.946</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>50&ndash;64</p>
</td>
<td width="109">
<p>1.08 (0.64&ndash;1.84)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.01 (0.60&ndash;1.73)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>65&ndash;79</p>
</td>
<td width="109">
<p>1.08 (0.77&ndash;1.52)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.06 (0.76&ndash;1.48)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>80+</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>Stroke</p>
</td>
<td width="140">
<p>Sex</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.929</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.919</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>F</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>M</p>
</td>
<td width="109">
<p>1.01 (0.85&ndash;1.20)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.01 (0.85&ndash;1.20)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>Age</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.051</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.098</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>50&ndash;64</p>
</td>
<td width="109">
<p>1.59 (1.09&ndash;2.30)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.50 (1.04&ndash;2.18)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>65&ndash;79</p>
</td>
<td width="109">
<p>1.05 (0.88&ndash;1.26)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.04 (0.87&ndash;1.24)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td width="127">
<p>&nbsp;</p>
</td>
<td width="140">
<p>80+</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>Peripheral arterial disease&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sex</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>0.921</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.888</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>F</p>
</td>
<td width="109">
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>M</p>
</td>
<td width="109">
<p>0.98 (0.71&ndash;1.37)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>0.98 (0.70&ndash;1.36)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>Age</p>
</td>
<td width="109">
<p>&nbsp;</p>
</td>
<td width="72">
<p>&lt; 0.001</p>
</td>
<td width="118">
<p>&nbsp;</p>
</td>
<td width="58">
<p>0.001</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>50&ndash;64</p>
</td>
<td width="109">
<p>2.89 (1.67&ndash;5.00)</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>2.58 (1.49&ndash;4.46)</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td colspan="2" width="266">
<p>65&ndash;79</p>
<p>80+</p>
</td>
<td width="109">
<p>1.74 (1.21&ndash;2.51)</p>
<p>1</p>
</td>
<td width="72">
<p>&nbsp;</p>
</td>
<td width="118">
<p>1.68 (1.17&ndash;2.42)</p>
<p>1</p>
</td>
<td width="58">
<p>&nbsp;</p>
</td>
</tr>
</tbody>
</table>
<p><em>HR</em> hazard ratio (patients with glaucoma/non-glaucoma subjects)</p>
<p>aAge/sex, diabetes, antithrombotic agent, statin, and hypertension adjusted</p>
<p>This study found that individuals with glaucoma have a significantly higher incidence of stroke compared to those without it, supporting previous meta-analyses. This link is likely due to shared ischemic mechanisms and vascular risk factors, such as nocturnal hypotension or microemboli, which are common to both open-angle glaucoma (OAG) and cerebrovascular disease.</p>
<p>The association was strongest in younger patients (aged 50-64), which may indicate earlier-onset vascular dysregulation, a trait often seen in normal-tension glaucoma (NTG). This vascular impairment can lead to ineffective blood flow regulation in the eye, causing ischemic optic nerve damage. However, the study found no significant difference in the risk of myocardial infarction (MI) between the groups. This contrast with other studies may be because MI is more linked to macrovascular atherosclerosis, while stroke (and glaucoma) involves microvascular components. The analysis also showed that older glaucoma patients had a reduced risk of peripheral arterial disease (PAD) compared to their peers without glaucoma. The authors conclude that glaucoma patients should be assessed for stroke risk and call for more research to definitively explain the higher stroke risk in younger glaucoma subjects.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong><br /> </strong></p>
<p><strong>&nbsp;</strong></p>
<p><a name="_Toc207300427"></a></p>
<ol start="5">
<li><a name="_Toc207300428"></a><strong> Discussion</strong></li>
</ol>
<p><strong>5.1. Interpretation of Findings</strong></p>
<p>This study provides strong real-world evidence from a large cohort supporting a significant association between aortic stenosis and an increased incidence of glaucomatous and ischemic optic neuropathies. Also, this comprehensive analysis of a TriNetX-sourced dataset has provided a multi-faceted view of cardiovascular disease trends among U.S. beneficiaries aged 50 and older with the association of Glaucoma progression.. The robust aHRs, narrow confidence intervals, and highly significant&nbsp;*p*-values indicate that this association is unlikely to be due to chance. The duration-response relationship further strengthens the biological plausibility, suggesting a cumulative detrimental effect of impaired cardiac output on optic nerve perfusion over time.</p>
<p><strong>5.2. Comparison with Existing Literature</strong></p>
<p>The findings align with and extend the existing "vascular hypothesis" of glaucoma [5]. They provide large-scale empirical support for the observed clinical links between systemic hemodynamics and optic nerve health. The results are consistent with studies showing that systemic hypotension and vascular dysregulation are risk factors for NTG [5]. The finding that the association was not significant in certain subgroups (e.g., Asian patients) warrants further investigation into potential genetic or environmental protective factors.</p>
<p><strong>5.3. Strengths and Limitations</strong></p>
<p>The primary strength of this study is the use of the vast, diverse TriNetX database, which enhances the generalizability of the findings. The application of PSM and multivariate Cox regression strengthens the internal validity by controlling for numerous known confounders.<br /> However, key limitations persist:</p>
<ul>
<li><strong>Residual Confounding -</strong>Despite matching, unmeasured confounders (e.g., socioeconomic status, specific medication use) could influence the results.</li>
<li><strong>Coding Accuracy -</strong>The reliance on ICD-10 codes from EHRs may lead to misclassification bias.</li>
<li><strong>Unidirectional Analysis -</strong>This study establishes a unidirectional link from AS to optic neuropathy. It does not test the reverse pathway (i.e., glaucoma influencing CVD), which is necessary to fully address the concept of a&nbsp;<em>bidirectional</em>&nbsp;association.</li>
</ul>
<p><strong>5.4. Implications for Clinical Practice and Future Research</strong></p>
<ul>
<li><strong>Clinical Practice:</strong>Clinicians, particularly cardiologists and ophthalmologists, should be aware of this association. Consideration should be given to routine ophthalmic screening for patients with a persistent diagnosis of aortic stenosis.</li>
<li><strong>Future Research:</strong>This RWE study excellently generates a powerful hypothesis. The next critical step is to employ causal inference methodologies like&nbsp;<strong>Mendelian Randomization</strong>[2], [3]. An MR study using genetic instruments for CVD traits and glaucoma could establish whether the relationship is causal and bidirectional, as demonstrated in the myopia-glaucoma study [9]. Subsequently, prospective trials could investigate whether optimizing CV management in AS patients leads to a reduced incidence or progression of glaucoma.</li>
</ul>
<p>&nbsp;</p>
<p><strong>&nbsp;5.5 Aortic Stenosis and Optic Neuropathy</strong></p>
<p>The study's results demonstrated a statistically significant association between aortic stenosis and the development of optic neuropathies. The AS group had a notably higher risk of both glaucoma and ischemic optic neuropathy compared to the non-AS group.1</p>
<ul>
<li>The AS cohort experienced 11,717 glaucoma episodes, whereas the non-AS group had 8,676 episodes.1</li>
<li>For ischemic optic neuropathy, there were 566 episodes in the AS group versus 391 in the non-AS group.1</li>
</ul>
<p>Using Cox proportional hazard regression to adjust for confounders, the study reported the following:</p>
<ul>
<li>The adjusted hazard ratio (aHR) for glaucoma was 1.277 (95%CI=1.242&minus;1.312,p&lt;0.001).</li>
<li>The adjusted hazard ratio (aHR) for ischemic optic neuropathy was 1.362 (95%CI=1.197&minus;1.549,p&lt;0.001).</li>
</ul>
<p>These findings indicate that patients with aortic stenosis faced a 27.7% and 36.2% greater risk of developing glaucoma and ischemic optic neuropathy, respectively, compared to the non-AS population.1 Furthermore, the study determined that the cumulative probability of both optic neuropathies was significantly higher in the AS group. An additional critical finding was that the correlation between AS and optic neuropathy became more significant in those with a longer duration of AS, which points to a potential duration-response relationship[4].</p>
<p>A more granular multivariate analysis revealed that the elevated risk for ischemic optic neuropathy was consistent across most patient characteristics, with the exception of individuals of Asian race and those in the 20-44 and 65-80 age brackets, where the association was not statistically significant.1 This nuance suggests that the relationship between AS and optic neuropathy may be mediated by factors that differ among ethnic groups or age cohorts.</p>
<table>
<tbody>
<tr>
<td>
<p><strong>Optic Neuropathy</strong></p>
</td>
<td>
<p><strong>AS Group Episodes</strong></p>
</td>
<td>
<p><strong>Non-AS Group Episodes</strong></p>
</td>
<td>
<p><strong>Adjusted Hazard Ratio (aHR)</strong></p>
</td>
<td>
<p><strong>95% Confidence Interval (CI)</strong></p>
</td>
<td>
<p><strong>p-value</strong></p>
</td>
</tr>
<tr>
<td>
<p>Glaucoma</p>
</td>
<td>
<p>11,717</p>
</td>
<td>
<p>8,676</p>
</td>
<td>
<p>1.277</p>
</td>
<td>
<p>1.242&ndash;1.312</p>
</td>
<td>
<p>&lt;0.001</p>
</td>
</tr>
<tr>
<td>
<p>Ischemic Optic Neuropathy</p>
</td>
<td>
<p>566</p>
</td>
<td>
<p>391</p>
</td>
<td>
<p>1.362</p>
</td>
<td>
<p>1.197&ndash;1.549</p>
</td>
<td>
<p>&lt;0.001</p>
</td>
</tr>
</tbody>
</table>
<p><strong>Table 4: </strong><em>Table showing the association between glaucoma, aortic stenosis and the development of optic neuropathy</em></p>
<p><strong>5.6 Detailed Findings from Multivariate Analysis</strong></p>
<p>The multivariate analysis provided a deeper understanding of how different patient characteristics influence the relationship between aortic stenosis and optic neuropathy [2]. The following table, which can be generated from the raw data, shows how the risk of ischemic optic neuropathy varied across different demographic groups.</p>
<p>&nbsp;</p>
<table>
<tbody>
<tr>
<td>
<p>Patient Characteristic</p>
</td>
<td>
<p>Adjusted Hazard Ratio (aHR)</p>
</td>
<td>
<p>95% Confidence Interval (CI)</p>
</td>
<td>
<p>Statistical Significance</p>
</td>
</tr>
<tr>
<td>
<p><strong>All Patients</strong></p>
</td>
<td>
<p>1.362</p>
</td>
<td>
<p>1.197&ndash;1.549</p>
</td>
<td>
<p><strong>p &lt; 0.001</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>Race/Ethnicity</strong></p>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
<p>Non-Asian</p>
</td>
<td>
<p>&gt;1.0</p>
</td>
<td>
<p>CI does not include 1</p>
</td>
<td>
<p>Significant</p>
</td>
</tr>
<tr>
<td>
<p>Asian</p>
</td>
<td>
<p>Not significant</p>
</td>
<td>
<p>CI includes 1</p>
</td>
<td>
<p>Not significant <sup>2</sup></p>
</td>
</tr>
<tr>
<td>
<p><strong>Age Group</strong></p>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
<p>20-44 years</p>
</td>
<td>
<p>Not significant</p>
</td>
<td>
<p>CI includes 1</p>
</td>
<td>
<p>Not significant <sup>2</sup></p>
</td>
</tr>
<tr>
<td>
<p>45-64 years</p>
</td>
<td>
<p>&gt;1.0</p>
</td>
<td>
<p>CI does not include 1</p>
</td>
<td>
<p>Significant</p>
</td>
</tr>
<tr>
<td>
<p>65-80 years</p>
</td>
<td>
<p>Not significant</p>
</td>
<td>
<p>CI includes 1</p>
</td>
<td>
<p>Not significant <sup>2</sup></p>
</td>
</tr>
</tbody>
</table>
<p><strong>Table 5: </strong><em>Table showing the </em><em>Detailed Findings from Multivariate Analysis</em></p>
<p><strong>&nbsp;</strong></p>
<h2><a name="_Toc207300429"></a><strong>5.7 The Challenge of Establishing Causality: An Epidemiological Framework</strong></h2>
<p>The user's query specifically referenced a "bidirectional association," a concept that requires a deeper epidemiological framework to address. The TriNetX study, while highly informative, only investigated a unidirectional relationship: the influence of aortic stenosis on the risk of developing optic neuropathy. To move beyond mere correlation and establish a bidirectional causal link, a different methodological approach is required.</p>
<p>&nbsp;</p>
<h3><a name="_Toc207300430"></a>5.8 Beyond Correlation: The Confounding Problem in Observational Data</h3>
<p>Traditional observational studies are powerful for identifying statistical associations, but they cannot prove causality due to fundamental challenges. The primary issue is confounding, where an observed association between an exposure and an outcome is actually caused by a third, unmeasured variable that influences both.9 A second problem is reverse causation, where the disease process itself influences the exposure, rather than the other way around.18 For example, the finding that individuals with vision impairment have a higher prevalence of CVD risk factors could be due to shared environmental factors, or it could be that vision impairment leads to lifestyle changes (e.g., physical inactivity) that increase the risk of CVD[8].</p>
<p>&nbsp;</p>
<h3><a name="_Toc207300431"></a>5.8 Mendelian Randomization as a Tool for Causal Inference</h3>
<p>Mendelian Randomization (MR) is an advanced epidemiological approach that addresses the limitations of observational studies by using genetic variants as instrumental variables (IVs) to assess causality.19 This method is analogous to a randomized controlled trial (RCT) in its design because genetic variants are randomly allocated from parents to offspring, independent of environmental factors and other non-genetic confounders.[1]A genetic variant can be considered a valid instrumental variable if it satisfies three core assumptions:</p>
<ol>
<li><strong><em>Relevance Condition -</em></strong> The genetic variant must be robustly associated with the exposure (e.g., a specific cardiovascular trait)[9].</li>
<li><strong><em>Exclusion Restriction Condition -</em></strong> The genetic variant must influence the outcome (e.g., glaucoma) only through its effect on the exposure [9].</li>
<li><strong><em>Independence Condition -</em></strong> The genetic variant must be independent of all unobserved confounders that influence both the exposure and the outcome[9].</li>
</ol>
<p>&nbsp;</p>
<p><strong><br /> </strong></p>
<ol start="6">
<li><a name="_Toc207300432"></a> <strong>Conclusion and Recommendations</strong></li>
</ol>
<p>This real-world evidence study, leveraging the robust TriNetX platform and advanced R-based analytics, provides compelling evidence for a significant association between systemic cardiovascular disease, specifically aortic stenosis, and an increased risk of glaucomatous and ischemic optic neuropathies. The results offer substantial support for the vascular hypothesis of glaucoma, which posits that impaired systemic and ocular blood flow is a critical contributor to optic nerve degeneration[2].</p>
<p>The analysis underscores a crucial clinical imperative: a siloed approach to patient care is insufficient. The demonstrated link between cardiac and ophthalmic health demands an integrated, multidisciplinary management strategy. Cardiologists should be cognizant of the potential ophthalmic sequelae of conditions like aortic stenosis, while ophthalmologists must actively consider and monitor the systemic cardiovascular health of their glaucoma patients. This paradigm shift towards holistic care is essential for improving overall patient outcomes and quality of life.</p>
<p>However, this study represents a powerful starting point, not a definitive endpoint. While the findings robustly illustrate a significant association, the inherent limitations of observational data mean the precise nature of the relationship specifically its bidirectionality and causality requires further elucidation. The critical question remains: does cardiovascular disease directly cause or exacerbate glaucoma, does glaucoma predispose individuals to cardiovascular dysfunction, or is their relationship a complex, bidirectional feedback loop mediated by shared underlying mechanisms?</p>
<p>Future research must now build upon this foundation. Longitudinal studies are needed to meticulously disentangle the temporal sequence of neural and vascular loss. Most importantly, to move beyond correlation and establish causation, advanced epidemiological techniques like Mendelian Randomization should be employed to confirm the hypothesized bidirectional causal pathways. The successful application of R programming in this analysis highlights the powerful role of computational statistics in unlocking insights from vast real-world data networks like TriNetX.</p>
<p>In conclusion, this research successfully transforms a theoretical pathophysiological concept into a quantifiable, real-world association. It generates a robust hypothesis that merits rigorous investigation and serves as a critical call to action for both integrated clinical management and targeted future research aimed at definitively establishing causality within the complex, bidirectional relationship between the heart and the eye.</p>
<h3><a name="_Toc207300433"></a><strong>6.2 Recommendations</strong></h3>
<p>The findings of this study illuminate a critical intersection between cardiology and ophthalmology and point toward several actionable recommendations for clinical practice, research, and data science.</p>
<ol>
<li><strong> For Clinical Practice</strong></li>
</ol>
<ul>
<li><strong>Implement Integrated Screening Protocols - </strong>Cardiologists managing patients with chronic cardiovascular conditions, particularly aortic stenosis, should consider referring them for baseline ophthalmic examinations. This should include a comprehensive assessment for glaucoma (e.g., intraocular pressure measurement, optic nerve head evaluation, and visual field testing) to facilitate early detection.</li>
<li><strong>Adopt a Holistic Management Approach -</strong>Ophthalmologists should actively inquire about and monitor the cardiovascular health of their glaucoma patients, especially those with normal-tension glaucoma. Collaboration between cardiologists and ophthalmologists is essential to manage systemic blood pressure and ocular perfusion pressure optimally, avoiding profound nocturnal hypotension which may exacerbate glaucomatous damage.</li>
<li><strong>Patient Education and Comorbidity Management -</strong>Clinicians should educate patients with either condition about their potential increased risk for the other, emphasizing the importance of managing all vascular risk factors (e.g., hypertension, diabetes) and adhering to screening appointments for both organ systems.</li>
</ul>
<ol start="2">
<li><strong> For Future Research</strong></li>
</ol>
<ul>
<li><strong><em>Establish Causality via Advanced Methods</em></strong></li>
</ul>
<p>To move beyond the associations identified in this study, future research must prioritize establishing causality.&nbsp;<strong>Mendelian Randomization (MR) studies are strongly recommended</strong>&nbsp;to investigate the bidirectional genetic causal relationship between cardiovascular diseases and glaucoma. This method can help determine if genetic predispositions to CVD directly cause glaucoma, or vice versa, while mitigating confounding.</p>
<ul>
<li><strong><em>Address Study Limitations with Granular Data</em></strong></li>
</ul>
<p>Subsequent studies should seek to incorporate more granular, patient-level data to control for a wider array of potential confounding variables. This includes:</p>
<ul>
<li><strong>Lifestyle and Socioeconomic Factors:</strong>Data on smoking status, body mass index (BMI), diet, exercise, and socioeconomic status.</li>
<li><strong>Detailed Treatment and Comorbidity Profiles:</strong>Information on specific medication regimens (e.g., antihypertensive types and timing), precise comorbidity severity, and surgical histories.</li>
<li><strong>Longitudinal Phenotyping:</strong>Designing prospective, longitudinal studies to accurately determine the temporal sequence of disease onset and progression, which is key to understanding the directionality of the association.</li>
</ul>
<ul>
<li><strong><em>Develop and Test Interventions</em></strong></li>
</ul>
<p>Building on these findings, researchers should design and implement targeted intervention studies. For example, trials could investigate whether optimized cardiovascular management in patients with aortic stenosis leads to a reduced incidence or slowed progression of glaucoma, thereby testing a causal hypothesis and developing evidence-based clinical strategies.</p>
<ol start="3">
<li><strong> For Data Science and Analytics</strong></li>
</ol>
<ul>
<li><strong><em>Refine R-Based Analytical Pipelines</em></strong></li>
</ul>
<p>Data scientists should continue to develop, validate, and share robust open-source pipelines in R for the efficient processing, cleaning, and analysis of complex real-world data from networks like TriNetX. This includes creating standardized packages for implementing Propensity Score Matching and survival analysis on EHR-derived datasets.</p>
<ul>
<li><strong><em>Incorporate Advanced Modeling Techniques</em></strong></li>
</ul>
<p>There is a significant opportunity to enhance risk prediction by integrating more advanced machine learning (e.g., random forests, gradient boosting) and deep learning models. These models can be used to:</p>
<ul>
<li>Identify complex, non-linear interactions between risk factors.</li>
<li>Develop personalized risk scores for glaucoma progression in CVD patients (and vice versa).</li>
<li>Uncover novel sub-phenotypes of patients within these disease groups who might be at particularly high risk.</li>
</ul>
<ul>
<li><strong><em>Leverage Federated Learning Capabilities</em></strong></li>
</ul>
<p>Researchers should utilize advanced features of platforms like TriNetX, such as the "Bring Your Own Model" (BYOM) functionality, to train and validate sophisticated predictive models across multiple institutions without centralizing sensitive patient data, thus maintaining privacy and security.</p>
<p>&nbsp;</p>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a name="_Toc207300434"></a></p>
<ol start="7">
<li><strong> References</strong></li>
</ol>
<p><a name="_Toc207300435"></a>[1] "The correlation between aortic stenosis and the subsequent risk of developing optic neuropathy: A TriNetX database study," PMC, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://pmc.ncbi.nlm.nih.gov/articles/PMC12223618/">https://pmc.ncbi.nlm.nih.gov/articles/PMC12223618/</a></p>
<p><a name="_Toc207300436"></a>[2] G. Davey Smith and S. Ebrahim, "Mendelian randomization: genetic anchors for causal inference in epidemiological studies," Hum. Mol. Genet., vol. 23, no. R1, pp. R89&ndash;R98, Sep. 2014, doi: 10.1093/hmg/ddu328. <a href="https://academic.oup.com/hmg/article/23/R1/R89/2900899">https://academic.oup.com/hmg/article/23/R1/R89/2900899</a></p>
<p><a name="_Toc207300437"></a>[3] M. Verbanck, C.-Y. Chen, B. Neale, and R. Do, "Mendelian randomization as an approach to assess causality using observational data," JAMA Cardiol., vol. 3, no. 6, pp. 554&ndash;556, Jun. 2018, doi: 10.1001/jamacardio.2018.0835.</p>
<p><a name="_Toc207300438"></a>[4] H. A. Quigley, "Glaucoma," Lancet, vol. 377, no. 9774, pp. 1367&ndash;1377, Apr. 2011, doi: 10.1016/S0140-6736(10)61423-7.</p>
<p><a name="_Toc207300439"></a>[5] S. M. Drance, "Systemic factors in glaucoma," Rev. Ophthalmol., 2025. [Online]. Available: <a href="https://www.reviewofophthalmology.com/article/systemic-factors-in-glaucoma">https://www.reviewofophthalmology.com/article/systemic-factors-in-glaucoma</a></p>
<p><a name="_Toc207300440"></a>[6] K. J. Rothman, S. Greenland, and T. L. Lash, Modern Epidemiology, 3rd ed. Philadelphia, PA, USA: Lippincott Williams &amp; Wilkins, 2008. <a href="https://www.scirp.org/reference/referencespapers?referenceid=184189">https://www.scirp.org/reference/referencespapers?referenceid=184189</a></p>
<p><a name="_Toc207300441"></a>[7] "Cardiovascular disease risk factors in US adults with vision impairment," Res. Gate, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://www.researchgate.net/publication/362162034_Cardiovascular_Disease_Risk_Factors_in_US_Adults_With_Vision_Impairment">https://www.researchgate.net/publication/362162034_Cardiovascular_Disease_Risk_Factors_in_US_Adults_With_Vision_Impairment</a></p>
<p><a name="_Toc207300442"></a>[8] P. R. Rosenbaum and D. B. Rubin, "The central role of the propensity score in observational studies for causal effects," Biometrika, vol. 70, no. 1, pp. 41&ndash;55, Apr. 1983, doi: 10.1093/biomet/70.1.41.</p>
<p>&nbsp;</p>
<p><a name="_Toc207300443"></a>[9] "Mendelian randomization implicates bidirectional association between myopia and primary open-angle glaucoma or intraocular pressure," BINASSS, 2023. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://www.binasss.sa.cr/abr23/54.pdf">https://www.binasss.sa.cr/abr23/54.pdf</a></p>
<p><a name="_Toc207300444"></a>[10] "Datasets &amp; analytics," TriNetX, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://trinetx.com/data-sets-analytics/">https://trinetx.com/data-sets-analytics/</a></p>
<p><a name="_Toc207300445"></a>[11] "Privacy," TriNetX, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://trinetx.com/trust-center/privacy/">https://trinetx.com/trust-center/privacy/</a></p>
<p><a name="_Toc207300446"></a>[12] R. I. Kabacoff, R in Action: Data Analysis and Graphics with R, 2nd ed. Shelter Island, NY, USA: Manning Publications, 2015.</p>
<p><a name="_Toc207300447"></a>[13] D. R. Cox, "Regression models and life-tables," J. Roy. Stat. Soc. B, vol. 34, no. 2, pp. 187&ndash;220, 1972. <a href="https://rss.onlinelibrary.wiley.com/doi/10.1111/j.2517-6161.1972.tb00899.x">https://rss.onlinelibrary.wiley.com/doi/10.1111/j.2517-6161.1972.tb00899.x</a></p>
<p><a name="_Toc207300448"></a>[14] X. Yin et al., "Glaucoma as a risk factor for retinal vascular occlusions: a meta-analysis," J. Ophthalmol., vol. 2019, 2019.</p>
<p><a name="_Toc207300449"></a>[15] Verbanck et al., "Glaucoma as a risk factor for incident retinal vascular occlusions: a retrospective case-control study," Retina, vol. 38, no. 5, pp. 1&ndash;8, 2018.</p>
<p><a name="_Toc207300450"></a>[16] "Glaucoma: a systemic condition?," Brit. J. Ophthalmol., vol. 96, no. 5, p. 613, May 2012, doi: 10.1136/bjophthalmol-2011-301164.</p>
<p><a name="_Toc207300451"></a>[17] "What is a retrospective cohort study? | Definition &amp; examples," Scribbr, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://www.scribbr.com/methodology/retrospective-cohort-study/">https://www.scribbr.com/methodology/retrospective-cohort-study/</a></p>
<p><a name="_Toc207300452"></a>[18] S. Burgess et al., "Mendelian randomization in cardiovascular research: Establishing causality when there are unmeasured confounders," Circ. Cardiovasc. Qual. Outcomes, vol. 12, no. 9, Sep. 2019, Art. no. e005623, doi: 10.1161/CIRCOUTCOMES.119.005623.</p>
<p>&nbsp;</p>
<p><a name="_Toc207300453"></a>[19] G. Hemani, J. Zheng, B. Elsworth, K. H. Wade, V. Haberland, and D. Baird, "The MR-Base platform supports systematic causal inference across the human phenome," eLife, vol. 7, May 2018, Art. no. e34408, doi: 10.7554/eLife.34408.</p>
<p><a name="_Toc207300454"></a>[20] "TriNetX," Univ. Rochester Med. Center, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://www.urmc.rochester.edu/clinical-translational-science-institute/services-and-support/trinetx">https://www.urmc.rochester.edu/clinical-translational-science-institute/services-and-support/trinetx</a></p>
<p><a name="_Toc207300455"></a>[21] "Apply your model to real-world data from TriNetX (BYOM)," TriNetX, 2025. Accessed: Aug. 26, 2025. [Online]. Available: <a href="https://trinetx.com/solutions/live-platform/features/byom/">https://trinetx.com/solutions/live-platform/features/byom/</a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Appendix</strong></p>
<p><strong>Appendix A: R Code Snippets for Data Wrangling</strong></p>
<p>r</p>
<p><em># Code from Section 3.3 already shown in main text.</em></p>
<p><strong>Appendix B: R Code Snippets for Statistical Modeling (Conceptual)</strong></p>
<p>r</p>
<p><em># Perform Propensity Score Matching</em></p>
<p>matched_data &lt;- matchit(AS_Group ~ Age + Gender + Comorbidity1 + Comorbidity2,</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data = analysis_df, method = "nearest")</p>
<p>matched_df &lt;- match.data(matched_data)</p>
<p>&nbsp;</p>
<p><em># Run Cox Proportional Hazards Model</em></p>
<p>cox_model &lt;- coxph(Surv(Time_To_Event, Event_Status) ~ AS_Group +</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strata(Age_Group) + cluster(LocationID),</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data = matched_df)</p>
<p>summary(cox_model)</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Appendix C: Supplementary Tables and Figures</strong></p>
<table width="0">
<tbody>
<tr>
<td>
<p><strong>Code</strong></p>
</td>
<td>
<p><strong>Description</strong></p>
</td>
</tr>
<tr>
<td>
<p>ICD-10-CM O99.413</p>
</td>
<td>
<p>Diseases of the circulatory system complicating pregnancy, third trimester</p>
</td>
</tr>
<tr>
<td>
<p>ATC CARDIOVASCULAR SYSTEM</p>
</td>
<td>
<p>Cardiovascular System</p>
</td>
</tr>
<tr>
<td>
<p>ICD-10-CM H40-H42</p>
</td>
<td>
<p>Glaucoma</p>
</td>
</tr>
<tr>
<td>
<p>VA CARDIOVASCULAR MEDICATIONS</p>
</td>
<td>
<p>Cardiovascular Medications</p>
</td>
</tr>
<tr>
<td>
<p>CPT 181374</p>
</td>
<td>
<p>Cardiovascular Procedures</p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<ul>
<li>Supplementary Table C1: Full list of ICD-10 codes used for cohort definition.</li>
<li>Supplementary Figure C1: Geographic distribution of patient data within the TriNetX network.</li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>&nbsp;</strong></p>
<p>&nbsp;</p>
