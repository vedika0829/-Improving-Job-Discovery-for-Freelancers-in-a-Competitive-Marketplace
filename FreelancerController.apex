public with sharing class FreelancerProfileController {
    
    // Properties to hold the metrics data
    public Integer projectCompletion { get; set; }
    public String metricDetails { get; set; }

    public FreelancerProfileController() {
        // Initialize the metrics data
        projectCompletion = getProjectCompletion();
        metricDetails = getMetricDetails();
    }

    @AuraEnabled(cacheable=true)
    public static Integer getProjectCompletion() {
        // Replace with actual logic to get the completion percentage
        return 75; // Example value
    }

    @AuraEnabled(cacheable=true)
    public static String getMetricDetails() {
        // Replace with actual logic to get the metric details
        return 'Project completion rate and active metrics'; // Example value
    }
}
