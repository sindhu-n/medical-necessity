library DiagnosticEESDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include DiagnosticEES version '1.0.0' called DiagnosticEES

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Cardiac arrhythmia": '2.16.840.1.113883.3.6037.1001.23.97.19'
valueset "Diagnostic Endocardial Electrical Stimulation (Pacing)":'2.16.840.1.113883.3.6037.1001.23.97.20'

parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ClaimResponse" ClaimResponse

context Patient

define "PrimaryDiagnosesResources":
	DiagnosticEES."PrimaryDiagnosesResources"

define PrimaryDecision:
	if (Last("PrimaryDiagnosesResources") is not null)
	then true
	else false

define FinalDecision:
	if ("PrimaryDecision" = true)
	then 'YES'
	else 'NO'