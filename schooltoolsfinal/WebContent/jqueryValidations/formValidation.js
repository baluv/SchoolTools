jQuery.validator.addMethod( 
	  "selectNone", 
	  function(value, element) { 
	    if (element.value == "none") 
	    { 
	      return false; 
	    } 
	    else return true; 
	  }, 
	  "Please select an option." 
	); 
	 
	 
	
 $(document).ready(function() {
	$("#School_Student").validate({
        rules: {
        	first_name: "required",
        	email: "required",
        	username: "required",
        		password: "required",
        		password2: "required",
        		admission_no: "required",
        			roll_no: "required",
        			academic_year: "required",
        			standard_id: "required",
        				
        				
        				section: "required",
        				schoolhouse_id: "required",
        				student_type: "required",
        					mode_of_transport: "required",
        					dob: "required",
        					bloodgroup: "required",
        					religion: "required",
        					community: "required",
        					living_with: "required",
        						
        						
        					report_to_email: "required",
        					allergic_medicine_food: "required",
        					extracurricular: "required",
        					school: "required",
        					gender: "required",
        					nationality: "required",
        					city: "required",
        					state: "required",
        					country: "required",
        					zip_code: "required"
        					
        					
                	               
        	               
               
           
       
         
        },
        });
 });
 
 $(document).ready(function() {
		$("#Student_Admission").validate({
	        rules: {
	        	name: "required",
	        	gender: "required",
	        	dob1: "required",
	        		
	        	age: "required",
	        	address1: "required",
	        	father_name: "required",
	        		
	        		
	        		fa_off_address1: "required",
	        		fa_mobile: "required",
	        		mother_name: "required",
	       
	        		father_monthly_income: "required"
	        },
	        });
	 });
     