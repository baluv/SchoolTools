package com.school.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.school.domain.Marksheets_Assessments;
import com.school.domain.Marksheets_Evaluation;
import com.school.domain.Marksheets_Studentremarks;
import com.school.domain.School_Maincategory;
import com.school.domain.School_Subcategory;
import com.school.domain.School_Tag;
import com.school.domain.School_Term;
import com.school.service.SchoolService;

@Controller
@RequestMapping("/school123")
public class PdfController {

	
	@Autowired(required = true)
	public SchoolService schoolservice;	
	
	@RequestMapping(value = "/getPdf")
	public void getPdf1st(OutputStream outputStream,HttpServletRequest req,@RequestParam("standard_id")Integer standard_id,
			@RequestParam("dob")String dob1,
			@RequestParam("student_name")String student_name,
			@RequestParam("rollno")Integer rollno,
			@RequestParam("standard")String standard_name,
			@RequestParam("year")String year)throws Exception{
		Document document = new Document(PageSize.A4);
		try {
			  PdfWriter.getInstance(document, outputStream);
	          document.open();
	          try{
	            //Image image = Image.getInstance ("webapps/schooltools/images/aecslogo.jpg");
		          Image image = Image.getInstance ("/opt/testing/tomcat8.4/webapps/schooltools/images/aecslogo.jpg");
		          //Image image = Image.getInstance ("C:/Users/Rajendra/Desktop/aecslogo.jpg");
		          image.scaleAbsolute(525f, 90f);
	              document.add(image);	              
	          }
	          catch(FileNotFoundException fe){
	        	  System.out.println("File not found exception occured in image path");
	        	  
	          }
	              Font font1 = new Font(FontFamily.HELVETICA, 8, Font.BOLD, BaseColor.WHITE);
	              Font font2 = new Font(FontFamily.HELVETICA, 8);
	              Font font3 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	              Font font4 = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
                  Paragraph para=new Paragraph();
                  Paragraph para1=new Paragraph();
         		  para.setAlignment(Element.ALIGN_CENTER);
         		 document.add(Chunk.NEWLINE);
         		 Chunk chunk = new Chunk("Student Report Card",font3);
         		 para.add(chunk);               
         		 para.add(Chunk.NEWLINE);
         		 Chunk chunk2 = new Chunk("2015-2016", font4);
         		 para.add(chunk2);         		 
         		para1.add(Chunk.NEWLINE);
         		Chunk Stname= new Chunk("Student Name                : "+student_name,font2);
         		para1.add(Stname);
         		Chunk space=new Chunk("                           ");
         		para1.add(space);
         		Chunk dob= new Chunk("Date Of Birth                 :"+dob1,font2);
         		para1.add(dob);
         		para1.add(Chunk.NEWLINE);
         		Chunk standard= new Chunk("Standard                        : "+standard_name,font2);
         		para1.add(standard);
                    document.add(Chunk.NEWLINE);   
                    document.add(Chunk.NEWLINE);
                    document.add(para);   
                    document.add(para1); 
                    List<School_Term> term=schoolservice.getterm(standard_id);
                    School_Term t1=term.get(0);
            		School_Term t2=term.get(1);
            		PdfPCell cell;
            		
            		
            		if(standard_id==12 || standard_id==13 || standard_id==14 || standard_id==16){
            			
       	             int k=0;
       	             List<School_Maincategory> s=schoolservice.getSubject(standard_id);
       	          System.out.println(s.size());
       	     		for(int i=0;i<s.size()-3;i++){
       	     			PdfPTable table = new PdfPTable(5);
          	             table.setWidthPercentage(100);
          	             float[] columnWidths = {4f,2f,2f,2f,2f};
          	             table.setWidths(columnWidths);
       	     			School_Maincategory sm=s.get(i);
       	     			 cell = new PdfPCell(new Phrase(sm.getName(), font1));
           	             cell.setRowspan(2); cell.setColspan(1);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	            
           	             cell = new PdfPCell(new Phrase(t1.getName(), font1));
           	             cell.setRowspan(1); cell.setColspan(2);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             cell = new PdfPCell(new Phrase(t2.getName(), font1));
           	             cell.setRowspan(1); cell.setColspan(2);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             
           	             cell = new PdfPCell(new Phrase("Grade", font1));
           	             cell.setRowspan(1); cell.setColspan(1);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             cell = new PdfPCell(new Phrase("Remarks", font1));
           	             cell.setRowspan(1); cell.setColspan(1);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             
           	             cell = new PdfPCell(new Phrase("Grade", font1));
           	             cell.setRowspan(1); cell.setColspan(1);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             cell = new PdfPCell(new Phrase("Remarks", font1));
           	             cell.setRowspan(1); cell.setColspan(1);
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             List<Marksheets_Evaluation> m=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
           	             List<Marksheets_Evaluation> m2=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId());
           	             List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
           	             System.out.println(ss.size());
           	             if(m.isEmpty()||m2.isEmpty()){
           	            	table.addCell(" ");
           	            	table.addCell(" ");
           	            	table.addCell(" ");
           	            	table.addCell(" ");;
           	            	table.addCell(" ");
                    }
           	             else{
           	             for(int j=0;j<ss.size();j++){
           	            	School_Subcategory sss = null;
           	            	Marksheets_Evaluation me = null;
           	            	Marksheets_Evaluation me2 = null;
           	            	try{
           	            	sss=ss.get(j);
           	            	 me=m.get(k);
           	            	me2=m2.get(k);
           	            	}catch(IndexOutOfBoundsException e){
           	            		System.out.println("Error line 188");
           	            		//e.printStackTrace();
           	            	}
           	            	 cell = new PdfPCell(new Phrase(sss.getName(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             cell = new PdfPCell(new Phrase(me.getGrade(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             
               	             cell = new PdfPCell(new Phrase(me.getDescription(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             
               	             cell = new PdfPCell(new Phrase(me2.getGrade(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             
               	             cell = new PdfPCell(new Phrase(me2.getDescription(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             k++; 
               	            }
           	             }
           	             
           	             table.setSpacingBefore(7.0f);       
                            table.setSpacingAfter(7.0f);         
                            document.add(table);
       	     		
       	     		}
       	     		for(int i=s.size()-3;i<s.size();i++){
       	     			PdfPTable table = new PdfPTable(3);
          	             table.setWidthPercentage(100);
          	             float[] columnWidths = {4f,2f,2f};
          	             table.setWidths(columnWidths);
       	     			School_Maincategory sm=s.get(i);
       	     			 cell = new PdfPCell(new Phrase(sm.getName(), font1));
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	            
           	             cell = new PdfPCell(new Phrase(t1.getName(), font1));
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             cell = new PdfPCell(new Phrase(t2.getName(), font1));
           	             cell.setBorderColor      (BaseColor.GRAY);
           	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
           	             cell.setPadding (6.5f);
           	             cell.setBorderWidth(1f);        
           	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
           	             table.addCell(cell);
           	             List<Marksheets_Evaluation> m=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
           	             List<Marksheets_Evaluation> m2=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId());
           	             List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
           	             int a=k;
           	          if(m.isEmpty()||m2.isEmpty()){
           	        	
           	        	table.addCell(" ");
           	        	table.addCell(" ");
           	        	table.addCell(" ");
           	          }else{
           	             for(int j=0;j<ss.size();j++){            	            	 
           	            	 School_Subcategory sss=ss.get(j);
           	            	 cell = new PdfPCell(new Phrase(sss.getName(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             if(i==s.size()-3){                	            	 
               	            	 Marksheets_Evaluation me=m.get(a);
               	            	 Marksheets_Evaluation me2=m2.get(a);            	            	
                   	             cell = new PdfPCell(new Phrase(me.getGrade(), font2));
                   	             cell.setBorderColor      (BaseColor.GRAY);
                   	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                   	             cell.setPadding (6.5f);
                   	             cell.setBorderWidth(1f);        
                   	             table.addCell(cell);
                   	             
                   	             cell = new PdfPCell(new Phrase(me2.getGrade(), font2));
                   	             cell.setBorderColor      (BaseColor.GRAY);
                   	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                   	             cell.setPadding (6.5f);
                   	             cell.setBorderWidth(1f);        
                   	             table.addCell(cell);
               	             a++;}else{
               	             Marksheets_Evaluation me=m.get(k);
           	            	 Marksheets_Evaluation me2=m2.get(k);            	            	
               	             cell = new PdfPCell(new Phrase(me.getDescription(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             
               	             cell = new PdfPCell(new Phrase(me2.getDescription(), font2));
               	             cell.setBorderColor      (BaseColor.GRAY);
               	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
               	             cell.setPadding (6.5f);
               	             cell.setBorderWidth(1f);        
               	             table.addCell(cell);
               	             k++;}
               	              
               	            }
        	             }
           	             
           	             table.setSpacingBefore(7.0f);       
                            table.setSpacingAfter(7.0f);         
                            document.add(table);
        	             
       	     		}
       	     		
       	     		
       	     		 PdfPTable table0 = new PdfPTable(2);
                        table0.setWidthPercentage(30);
          	             float[] columnWidths0 = {2f,2f};
       	             table0.setWidths(columnWidths0);
       	             cell = new PdfPCell(new Phrase("Grade", font1));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
       	             table0.addCell(cell);
       	          
       	             cell = new PdfPCell(new Phrase("Marks Range", font1));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("A+", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("Excellent", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell); 
       	             
       	             cell = new PdfPCell(new Phrase("A", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("Very Good", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell); 
       	             
       	             cell = new PdfPCell(new Phrase("B+", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("Good", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell); 
       	             
       	             cell = new PdfPCell(new Phrase("B", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("Satisfied", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell); 
       	             
       	             cell = new PdfPCell(new Phrase("C", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell);
       	            
       	             cell = new PdfPCell(new Phrase("Can Do Better", font2));      
       	             cell.setBorderColor      (BaseColor.GRAY);
       	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
       	             cell.setPadding (6.5f);
       	             cell.setBorderWidth(1f);        
       	             table0.addCell(cell); 
       	             table0.setSpacingBefore(5.0f);      
                        table0.setSpacingAfter(5.0f);                                    
                    
       	             document.add(table0);
       	             
       	         
       	          List<Marksheets_Studentremarks> msr=schoolservice.getmarksheets_studentremarks(standard_id,rollno);
     	         PdfPTable table5 = new PdfPTable(3);
                  table5.setWidthPercentage(100);
  	             float[] columnWidths3 = {2f,2f,2f};
  	             table5.setWidths(columnWidths3); 
                  table5.setSpacingBefore(1.0f);table5.setSpacingAfter(1.0f);                 
                  cell = new PdfPCell(new Phrase(" I Term ", font2));
  	             cell.setRowspan(1);cell.setColspan(3);
  	             cell.setBorderColor      (BaseColor.GRAY);
  	             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
  	             cell.setPadding (6.5f);
  	             cell.setBorderWidth(1f);       
  	             table5.addCell(cell);
  	            if(msr.isEmpty())
  	            {
  	             cell = new PdfPCell(new Phrase("  ", font1));
 	             cell.setRowspan(1);
 	             cell.setColspan(3);
 	             cell.setBorderColor      (BaseColor.GRAY);
 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	             cell.setPadding (6.5f);
 	             cell.setBorderWidth(1f);       
 	             table5.addCell(cell);
  	            }else{
  	            	 Marksheets_Studentremarks msrs=msr.get(0);
  	            	 cell = new PdfPCell(new Phrase(msrs.getRemark(), font2));
  		             cell.setRowspan(1);
  		             cell.setColspan(3);
  		             cell.setBorderColor      (BaseColor.GRAY);
  		             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
  		             cell.setPadding (6.5f);
  		             cell.setBorderWidth(1f);       
  		             table5.addCell(cell);
  	            }
 	             cell = new PdfPCell(new Phrase(" Director ", font1));
  	             cell.setRowspan(1);
  	             cell.setBorderColor      (BaseColor.GRAY);
  	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	             cell.setPadding (6.5f);
  	             cell.setBorderWidth(1f);       
  	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
  	             table5.addCell(cell);
  	             cell = new PdfPCell(new Phrase(" Coordinator ", font1));
  	             cell.setColspan(1);
  	             cell.setBorderWidth(1f); 
  	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	             cell.setBorderColor      (BaseColor.GRAY);
  	             cell.setPadding (5.0f);
  	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
  	             table5.addCell(cell);
  	             cell = new PdfPCell(new Phrase(" Class Teacher ",font1));
  	             cell.setColspan(1); 
  	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	             cell.setBorderColor      (BaseColor.GRAY);
  	             cell.setBorderWidth(1f);
  	             cell.setPadding (5.0f);
  	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
  	             table5.addCell(cell);
  	            if(msr.isEmpty())
  	            { 
  	            	
  	            	 cell = new PdfPCell (new Paragraph (" "));
          			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                             
 	 	             table5.addCell(cell);
 	 	             table5.addCell(cell);
 	 	             table5.addCell(cell);
  	            }else{
  	            	 Marksheets_Studentremarks msrs=msr.get(0);
  	            	 cell = new PdfPCell (new Paragraph (msrs.getBy_principal(),font2));
          			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                             
 	 	             table5.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph (msrs.getBy_coordinator(),font2));
         			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                             
 	 	             table5.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph (msrs.getBy_class_teacher(),font2));
         			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                             
 	 	             table5.addCell(cell);
  	            }
  	                  table5.setSpacingBefore(7.0f);       
  	                  table5.setSpacingAfter(7.0f);        
  	                  document.add(table5);   
  	                  
  	                  
  	                 PdfPTable table6 = new PdfPTable(3);
  	                 table6.setWidthPercentage(100);
  	 	             table6.setWidths(columnWidths3); 
  	                 table6.setSpacingBefore(1.0f);table6.setSpacingAfter(1.0f);                 
  	                 cell = new PdfPCell(new Phrase(" II Term ", font2));
  	 	             cell.setRowspan(1);cell.setColspan(3);
  	 	             cell.setBorderColor      (BaseColor.GRAY);
  	 	             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
  	 	             cell.setPadding (6.5f);
  	 	             cell.setBorderWidth(1f);       
  	 	             table6.addCell(cell);
  	 	           if(msr.isEmpty())
  	 	            {
  	 	             cell = new PdfPCell(new Phrase("  ", font1));
  		             cell.setRowspan(1);
  		             cell.setColspan(3);
  		             cell.setBorderColor      (BaseColor.GRAY);
  		             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  		             cell.setPadding (6.5f);
  		             cell.setBorderWidth(1f);       
  		             table6.addCell(cell);
  	 	            }else{
  	 	            	 Marksheets_Studentremarks msrs=msr.get(1);
  	 	            	 cell = new PdfPCell(new Phrase(msrs.getRemark(), font2));
  	 		             cell.setRowspan(1);
  	 		             cell.setColspan(3);
  	 		             cell.setBorderColor      (BaseColor.GRAY);
  	 		             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
  	 		             cell.setPadding (6.5f);
  	 		             cell.setBorderWidth(1f);       
  	 		             table6.addCell(cell);
  	 	            }
  	                 cell = new PdfPCell(new Phrase(" Director ", font1));
  	 	             cell.setRowspan(1);
  	 	             cell.setBorderColor      (BaseColor.GRAY);
  	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	 	             cell.setPadding (6.5f);
  	 	             cell.setBorderWidth(1f);       
  	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
  	 	             table6.addCell(cell);
  	 	             cell = new PdfPCell(new Phrase(" Coordinator ", font1));
  	 	             cell.setColspan(1);
  	 	             cell.setBorderWidth(1f); 
  	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	 	             cell.setBorderColor      (BaseColor.GRAY);
  	 	             cell.setPadding (5.0f);
  	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
  	 	             table6.addCell(cell);
  	 	             cell = new PdfPCell(new Phrase(" Class Teacher ",font1));
  	 	             cell.setColspan(1); 
  	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  	 	             cell.setBorderColor      (BaseColor.GRAY);
  	 	             cell.setBorderWidth(1f);
  	 	             cell.setPadding (5.0f);
  	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
  	 	             table6.addCell(cell);
  	 	            if(msr.isEmpty())
  	 	            {
  	 	            	 cell = new PdfPCell (new Paragraph (" "));
  	         			 cell.setBorderWidth(1f); 
  		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  		 	             cell.setBorderColor      (BaseColor.GRAY);
  		 	             cell.setPadding (5.0f);                             
  		 	             table6.addCell(cell);
  		 	             table6.addCell(cell);
  		 	             table6.addCell(cell);
  	 	            }else{

  	 	            	 Marksheets_Studentremarks msrs=msr.get(1);
  	 	            	 cell = new PdfPCell (new Paragraph (msrs.getBy_principal(),font2));
  	         			 cell.setBorderWidth(1f); 
  		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  		 	             cell.setBorderColor      (BaseColor.GRAY);
  		 	             cell.setPadding (5.0f);                             
  		 	             table6.addCell(cell);
  		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_coordinator(),font2));
  	        			 cell.setBorderWidth(1f); 
  		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  		 	             cell.setBorderColor      (BaseColor.GRAY);
  		 	             cell.setPadding (5.0f);                             
  		 	             table6.addCell(cell);
  		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_class_teacher(),font2));
  		 	             System.out.println(msrs.getBy_class_teacher()+"****<<<");
  	        			 cell.setBorderWidth(1f); 
  		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
  		 	             cell.setBorderColor      (BaseColor.GRAY);
  		 	             cell.setPadding (5.0f);                             
  		 	             table6.addCell(cell);
  	 	            }
  	 	                  table6.setSpacingBefore(7.0f);       
  	 	                  table6.setSpacingAfter(7.0f);        
  	 	                  document.add(table6); 
       	             //1st
           		}else if(standard_id==11 || standard_id==15){
                   	 School_Term t3=term.get(2);
                	 School_Term t4=term.get(3);
                	 School_Term t5=term.get(4);
                	 School_Term t6=term.get(5);
    	             PdfPTable table = new PdfPTable(12);
    	             table.setWidthPercentage(100);
    	             float[] columnWidths = {2f,2f,2f,2f,2f,2f,2f,2f,2f,2f,2f,2f};
    	             table.setWidths(columnWidths);
    	                        
    	             cell = new PdfPCell(new Phrase("ASSESSMENT / SUBJECTS", font1));
    	             cell.setRowspan(1); cell.setColspan(2);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setPadding (6.5f);
    	             cell.setBorderWidth(1f);        
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase(t1.getName(), font1));
    	             cell.setColspan(1);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase(t2.getName(), font1));
    	             cell.setColspan(1); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase(t3.getName(), font1));
    	             cell.setColspan(3);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase(t4.getName(), font1));
    	             cell.setColspan(1); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase(t5.getName(), font1));
    	             cell.setColspan(1);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase(t6.getName(), font1));
    	             cell.setColspan(3); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell (new Paragraph ("Max Marks", font1));
                     cell.setColspan(2);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase("50", font1));
    	             cell.setColspan(1);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase("50", font1));
    	             cell.setColspan(1); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase("100", font1));
    	             cell.setColspan(3);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase("50", font1));
    	             cell.setColspan(1); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
    	             cell = new PdfPCell(new Phrase("50", font1));
    	             cell.setColspan(1);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);	             
    	             cell = new PdfPCell(new Phrase("100", font1));
    	             cell.setColspan(3); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setBorderWidth(1f);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table.addCell(cell);
                     cell = new PdfPCell (new Paragraph ("Subjects", font1));
                     cell.setColspan(2);
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                  
    	             table.addCell(cell);
                     List<School_Tag> tag=schoolservice.getschool_tag(standard_id);
    	             for(int t=0;t<tag.size();t++){
    	             School_Tag st=tag.get(t);
    	             cell = new PdfPCell (new Paragraph (st.getName(), font1));
    	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);
    	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                  
    	             table.addCell(cell);             
    	             }	             
    	                     
    	             List<School_Maincategory> s=schoolservice.getSubject(standard_id);
    	             for(int i=0;i<6;i++){
    	             School_Maincategory ss=s.get(i);	             
    	             cell = new PdfPCell (new Paragraph (ss.getName(), font2));
    	             cell.setColspan(2);
    	             cell.setBorderWidth(1f);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);  cell.setHorizontalAlignment (Element.ALIGN_CENTER);                             
    	             table.addCell(cell);
    	             List<String> mnotes=schoolservice.getmarksheets_studentnotes(standard_id,rollno);
    	             if(mnotes.isEmpty()){
    	            	 table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    		             table.addCell(" ");
    	             }
    	             else
    	             {
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+6), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+12), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+18), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+24), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+30), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+36), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+42), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+48), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	            	 cell = new PdfPCell (new Paragraph (mnotes.get(i+54), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	            	 table.addCell(cell);
    	             }
    	             }
    	             
    	             School_Maincategory ss=s.get(6);	             
    	             cell = new PdfPCell (new Paragraph (ss.getName(), font2));
    	             cell.setColspan(2);
    	             cell.setBorderWidth(1f);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setPadding (5.0f);  cell.setHorizontalAlignment (Element.ALIGN_CENTER);                             
    	             table.addCell(cell);
    	             List<String> mgrade=schoolservice.getmarksheets_studentgrade(standard_id,rollno);
    	             for(int j=0;j<10;j++)
    	             {
    	            	 if(mgrade.isEmpty()){
    	            		 cell = new PdfPCell (new Paragraph (" ", font2));
    	            	 }else{
    	            	 cell = new PdfPCell (new Paragraph (mgrade.get(j), font2));
    	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);	            	 
    	            	 }
    	            	 table.addCell(cell);
    	             }
    	             table.setSpacingBefore(7.0f);       
                     table.setSpacingAfter(7.0f);         
                     document.add(table);
                     PdfPTable tableo = new PdfPTable(1);
    	             tableo.setWidthPercentage(100);
    	             float[] columnWidths0 = {2f};
    	             tableo.setWidths(columnWidths0);
    	             PdfPCell cell2;	      
    	             cell2 = new PdfPCell(new Phrase("Grading Points: A1: 90-100 A2: 80-89 B1: 70-79 B2: 60-69 C1: 50-59 C2: 40-49 D1: 30-39 D2: 20-29 E: 0-19", font1));      
    	             cell2.setBorderColor      (BaseColor.GRAY);
    	             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell2.setPadding (6.5f);
    	             cell2.setBorderWidth(1f);        
    	             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             tableo.addCell(cell2);
    	             tableo.setSpacingBefore(2.0f);      
                     tableo.setSpacingAfter(10.0f);                                    
                     document.add(tableo); 
                     
                     
                     
                     
                     PdfPTable table2 = new PdfPTable(3);
    	             table2.setWidthPercentage(100);
    	             float[] columnWidths1 = {3f,2f,2f};
    	             table2.setWidths(columnWidths1);
    	             PdfPCell cell1;	      
    	             School_Maincategory sm=s.get(7);
    	             List<School_Subcategory> ss1=schoolservice.getSubcategory(sm.getId());
    	             cell1 = new PdfPCell(new Phrase(sm.getName(), font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table2.addCell(cell1);
    	             
    	             cell1 = new PdfPCell(new Phrase("I", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table2.addCell(cell1);
    	             cell1 = new PdfPCell(new Phrase("II", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));
    	             table2.addCell(cell1);
    	             int c=0;
    	             for(int j=0;j<ss1.size();j++){	 	           
              			 School_Subcategory sss=ss1.get(j);          			
              			 List<String> me1=schoolservice.getmarksheets_studentterm1grade(standard_id,rollno,t1.getId());
              			List<String> me2=schoolservice.getmarksheets_studentterm2grade(standard_id,rollno,t2.getId());
              			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
              			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                          
    	 	             table2.addCell(cell);	 	             
    	 	             if(me1.isEmpty())
    	 	             {
    	 	            	table2.addCell(" ");
    	 	            	table2.addCell(" ");	          		           			 	             
    	 	             }else{	 	            	 
    	 	            	 cell = new PdfPCell (new Paragraph (me1.get(j), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	            	table2.addCell(cell);
    	 	            	 cell = new PdfPCell (new Paragraph (me2.get(j), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    		 	             table2.addCell(cell);
    		 	             }
    	 	          c++; } 
    	             table2.setSpacingBefore(10.0f);      
                     table2.setSpacingAfter(5.0f);                                    
                     document.add(table2); 
                     
                     PdfPTable table3 = new PdfPTable(3);
    	             table3.setWidthPercentage(100);
    	             table3.setWidths(columnWidths1);
    	             School_Maincategory sm2=s.get(8);
    	             List<School_Subcategory> ss2=schoolservice.getSubcategory(sm2.getId());
    	             cell1 = new PdfPCell(new Phrase(sm2.getName(), font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table3.addCell(cell1);	             
    	             cell1 = new PdfPCell(new Phrase("I", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table3.addCell(cell1);
    	             cell1 = new PdfPCell(new Phrase("II", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));
    	             table3.addCell(cell1);
    	             for(int j=0;j<ss2.size();j++){	 	           
              			 School_Subcategory sss=ss2.get(j);          			
              			 List<String> me1=schoolservice.getmarksheets_studentterm1grade(standard_id,rollno,t1.getId());
              			List<String> me2=schoolservice.getmarksheets_studentterm2grade(standard_id,rollno,t2.getId());
              			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
              			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                          
    	 	             table3.addCell(cell);	 	             
    	 	             if(me1.isEmpty())
    	 	             {
    	 	            	table3.addCell(" ");
    	 	            	table3.addCell(" ");	          		           			 	             
    	 	             }else{	 	            	 
    	 	            	 cell = new PdfPCell (new Paragraph (me1.get(c), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	            	table3.addCell(cell);
    	 	            	 cell = new PdfPCell (new Paragraph (me2.get(c), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    		 	             table3.addCell(cell);
    		 	             }
    	 	          c++; } 
    	             table3.setSpacingBefore(5.0f);      
                     table3.setSpacingAfter(5.0f);                                    
                     document.add(table3); 
                     
                     PdfPTable table0 = new PdfPTable(1);
                     table0.setWidthPercentage(100);
    	             table0.setWidths(columnWidths0);
    	             cell2 = new PdfPCell(new Phrase("Grading Scale: A1: Excellent A2: Very Good B1: Good B2: Average C: Below Average", font1));      
    	             cell2.setBorderColor      (BaseColor.GRAY);
    	             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell2.setPadding (6.5f);
    	             cell2.setBorderWidth(1f);        
    	             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table0.addCell(cell2);
    	             table0.setSpacingBefore(5.0f);      
                     table0.setSpacingAfter(5.0f);                                    
                     document.add(table0);
                     
                     
                     
                     PdfPTable table4 = new PdfPTable(3);
    	             table4.setWidthPercentage(100);
    	             table4.setWidths(columnWidths1);
    	             School_Maincategory sm3=s.get(9);
    	             List<School_Subcategory> ss3=schoolservice.getSubcategory(sm3.getId());
    	             cell1 = new PdfPCell(new Phrase(sm3.getName(), font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table4.addCell(cell1);	             
    	             cell1 = new PdfPCell(new Phrase("I", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));  
    	             table4.addCell(cell1);
    	             cell1 = new PdfPCell(new Phrase("II", font1));      
    	             cell1.setBorderColor      (BaseColor.GRAY);
    	             cell1.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell1.setPadding (6.5f);
    	             cell1.setBorderWidth(1f);        
    	             cell1.setBackgroundColor (new BaseColor (59, 89, 152));
    	             table4.addCell(cell1);
    	             for(int j=0;j<ss3.size();j++){	 	           
              			 School_Subcategory sss=ss3.get(j);          			
              			 List<String> me1=schoolservice.getmarksheets_studentterm1grade(standard_id,rollno,t1.getId());
              			List<String> me2=schoolservice.getmarksheets_studentterm2grade(standard_id,rollno,t2.getId());
              			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
              			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                          
    	 	             table4.addCell(cell);	 	             
    	 	             if(me1.isEmpty())
    	 	             {
    	 	            	 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
    	          			 cell.setBorderWidth(1f); 
    		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    		 	             cell.setBorderColor      (BaseColor.GRAY);
    		 	             cell.setPadding (5.0f);
    	 	            	 table4.addCell(" ");
    	 	            	 table4.addCell(" ");	          		           			 	             
    	 	             }else{	 	            	 
    	 	            	 cell = new PdfPCell (new Paragraph (me1.get(c), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	            	 table4.addCell(cell);
    	 	            	 cell = new PdfPCell (new Paragraph (me2.get(c), font2));
    	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    		 	             table4.addCell(cell);
    		 	             }
    	 	          c++; } 
    	             table4.setSpacingBefore(5.0f);      
                     table4.setSpacingAfter(30.0f);                                    
                     document.add(table4); 
                     System.out.println("*******************");
                	 List<Marksheets_Studentremarks> msr=schoolservice.getmarksheets_studentremarks(standard_id,rollno);
        	         PdfPTable table5 = new PdfPTable(3);
                     table5.setWidthPercentage(100);
     	             float[] columnWidths3 = {2f,2f,2f};
     	             table5.setWidths(columnWidths3); 
                     table5.setSpacingBefore(1.0f);table5.setSpacingAfter(1.0f);                 
                     cell = new PdfPCell(new Phrase(" I Term ", font2));
     	             cell.setRowspan(1);cell.setColspan(3);
     	             cell.setBorderColor      (BaseColor.GRAY);
     	             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
     	             cell.setPadding (6.5f);
     	             cell.setBorderWidth(1f);       
     	             table5.addCell(cell);
     	            if(msr.isEmpty())
     	            {
     	             cell = new PdfPCell(new Phrase("  ", font1));
    	             cell.setRowspan(1);
    	             cell.setColspan(3);
    	             cell.setBorderColor      (BaseColor.GRAY);
    	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	             cell.setPadding (6.5f);
    	             cell.setBorderWidth(1f);       
    	             table5.addCell(cell);
     	            }else{
     	            	 Marksheets_Studentremarks msrs=msr.get(0);
     	            	 cell = new PdfPCell(new Phrase(msrs.getRemark(), font2));
     		             cell.setRowspan(1);
     		             cell.setColspan(3);
     		             cell.setBorderColor      (BaseColor.GRAY);
     		             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
     		             cell.setPadding (6.5f);
     		             cell.setBorderWidth(1f);       
     		             table5.addCell(cell);
     	            }
    	             cell = new PdfPCell(new Phrase(" Director ", font1));
     	             cell.setRowspan(1);
     	             cell.setBorderColor      (BaseColor.GRAY);
     	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	             cell.setPadding (6.5f);
     	             cell.setBorderWidth(1f);       
     	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
     	             table5.addCell(cell);
     	             cell = new PdfPCell(new Phrase(" Coordinator ", font1));
     	             cell.setColspan(1);
     	             cell.setBorderWidth(1f); 
     	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	             cell.setBorderColor      (BaseColor.GRAY);
     	             cell.setPadding (5.0f);
     	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
     	             table5.addCell(cell);
     	             cell = new PdfPCell(new Phrase(" Class Teacher ",font1));
     	             cell.setColspan(1); 
     	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	             cell.setBorderColor      (BaseColor.GRAY);
     	             cell.setBorderWidth(1f);
     	             cell.setPadding (5.0f);
     	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
     	             table5.addCell(cell);
     	            if(msr.isEmpty())
     	            { 
     	            	
     	            	 cell = new PdfPCell (new Paragraph (" "));
             			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                             
    	 	             table5.addCell(cell);
    	 	             table5.addCell(cell);
    	 	             table5.addCell(cell);
     	            }else{
     	            	 Marksheets_Studentremarks msrs=msr.get(0);
     	            	 cell = new PdfPCell (new Paragraph (msrs.getBy_principal(),font2));
             			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                             
    	 	             table5.addCell(cell);
    	 	             cell = new PdfPCell (new Paragraph (msrs.getBy_coordinator(),font2));
            			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                             
    	 	             table5.addCell(cell);
    	 	             cell = new PdfPCell (new Paragraph (msrs.getBy_class_teacher(),font2));
            			 cell.setBorderWidth(1f); 
    	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
    	 	             cell.setBorderColor      (BaseColor.GRAY);
    	 	             cell.setPadding (5.0f);                             
    	 	             table5.addCell(cell);
     	            }
     	                  table5.setSpacingBefore(7.0f);       
     	                  table5.setSpacingAfter(7.0f);        
     	                  document.add(table5);   
     	                  
     	                  
     	                 PdfPTable table6 = new PdfPTable(3);
     	                 table6.setWidthPercentage(100);
     	 	             table6.setWidths(columnWidths3); 
     	                 table6.setSpacingBefore(1.0f);table6.setSpacingAfter(1.0f);                 
     	                 cell = new PdfPCell(new Phrase(" II Term ", font2));
     	 	             cell.setRowspan(1);cell.setColspan(3);
     	 	             cell.setBorderColor      (BaseColor.GRAY);
     	 	             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
     	 	             cell.setPadding (6.5f);
     	 	             cell.setBorderWidth(1f);       
     	 	             table6.addCell(cell);
     	 	           if(msr.isEmpty())
     	 	            {
     	 	             cell = new PdfPCell(new Phrase("  ", font1));
     		             cell.setRowspan(1);
     		             cell.setColspan(3);
     		             cell.setBorderColor      (BaseColor.GRAY);
     		             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     		             cell.setPadding (6.5f);
     		             cell.setBorderWidth(1f);       
     		             table6.addCell(cell);
     	 	            }else{
     	 	            	 Marksheets_Studentremarks msrs=msr.get(1);
     	 	            	 cell = new PdfPCell(new Phrase(msrs.getRemark(), font2));
     	 		             cell.setRowspan(1);
     	 		             cell.setColspan(3);
     	 		             cell.setBorderColor      (BaseColor.GRAY);
     	 		             cell.setHorizontalAlignment (Element.ALIGN_LEFT);
     	 		             cell.setPadding (6.5f);
     	 		             cell.setBorderWidth(1f);       
     	 		             table6.addCell(cell);
     	 	            }
     	                 cell = new PdfPCell(new Phrase(" Director ", font1));
     	 	             cell.setRowspan(1);
     	 	             cell.setBorderColor      (BaseColor.GRAY);
     	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	 	             cell.setPadding (6.5f);
     	 	             cell.setBorderWidth(1f);       
     	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
     	 	             table6.addCell(cell);
     	 	             cell = new PdfPCell(new Phrase(" Coordinator ", font1));
     	 	             cell.setColspan(1);
     	 	             cell.setBorderWidth(1f); 
     	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	 	             cell.setBorderColor      (BaseColor.GRAY);
     	 	             cell.setPadding (5.0f);
     	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
     	 	             table6.addCell(cell);
     	 	             cell = new PdfPCell(new Phrase(" Class Teacher ",font1));
     	 	             cell.setColspan(1); 
     	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     	 	             cell.setBorderColor      (BaseColor.GRAY);
     	 	             cell.setBorderWidth(1f);
     	 	             cell.setPadding (5.0f);
     	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
     	 	             table6.addCell(cell);
     	 	            if(msr.isEmpty())
     	 	            {
     	 	            	 cell = new PdfPCell (new Paragraph (" "));
     	         			 cell.setBorderWidth(1f); 
     		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     		 	             cell.setBorderColor      (BaseColor.GRAY);
     		 	             cell.setPadding (5.0f);                             
     		 	             table6.addCell(cell);
     		 	             table6.addCell(cell);
     		 	             table6.addCell(cell);
     	 	            }else{System.out.println("In else pdfffff>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
     	 	            	 Marksheets_Studentremarks msrs=msr.get(1);
     	 	            	 cell = new PdfPCell (new Paragraph (msrs.getBy_principal(),font2));
     	         			 cell.setBorderWidth(1f); 
     		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     		 	             cell.setBorderColor      (BaseColor.GRAY);
     		 	             cell.setPadding (5.0f);                             
     		 	             table6.addCell(cell);
     		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_coordinator(),font2));
     	        			 cell.setBorderWidth(1f); 
     		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     		 	             cell.setBorderColor      (BaseColor.GRAY);
     		 	             cell.setPadding (5.0f);                             
     		 	             table6.addCell(cell);
     		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_class_teacher(),font2));
     	        			 cell.setBorderWidth(1f); 
     		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
     		 	             cell.setBorderColor      (BaseColor.GRAY);
     		 	             cell.setPadding (5.0f);                             
     		 	             table6.addCell(cell);
     	 	            }
     	 	                  table6.setSpacingBefore(7.0f);       
     	 	                  table6.setSpacingAfter(7.0f);        
     	 	                  document.add(table6);  
                     
    	                document.add(Chunk.NEWLINE);
    	                document.newPage();
    	                
    	                document.close();	
            		
            		//2nd
            		}else{
	                
            			
            			
            			
            			
            			
            			
            			
            		 if(standard_id>5){
	            	 School_Term t3=term.get(2);
		             PdfPTable table = new PdfPTable(12);
		             table.setWidthPercentage(100);
		             float[] columnWidths = {4f, 2f, 2f,2f,2f,2f,2f,2f,2f,2f,2f,2f};
		             table.setWidths(columnWidths);            
		             cell = new PdfPCell(new Phrase("ASSESSMENT / SUBJECTS", font1));
		             cell.setRowspan(2);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell.setPadding (6.5f);
		             cell.setBorderWidth(1f);        
		             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		             table.addCell(cell);	             
		             cell = new PdfPCell(new Phrase(t1.getName(), font1));
		             cell.setColspan(3);
		             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setPadding (5.0f);
		             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		             table.addCell(cell);	             
		             cell = new PdfPCell(new Phrase(t2.getName(), font1));
		             cell.setColspan(4); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setBorderWidth(1f);
		             cell.setPadding (5.0f);
		             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		             table.addCell(cell);
		             cell = new PdfPCell(new Phrase(t3.getName(), font1));
		             cell.setColspan(4); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setBorderWidth(1f);
		             cell.setPadding (5.0f);
		             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		             table.addCell(cell);
		             List<School_Tag> tag=schoolservice.getschool_tag(standard_id);
		             for(int t=0;t<tag.size();t++){
		             School_Tag st=tag.get(t);
		             cell = new PdfPCell (new Paragraph (st.getName(), font1));
		             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setPadding (5.0f);
		             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                  
		             table.addCell(cell);    
		             }	             
		             List<School_Maincategory> s=schoolservice.getSubject(standard_id);
		             School_Maincategory smain=s.get(0);
		             int k=smain.getId();
		             
		             
		             for(int i=0;i<6;i++){
		             School_Maincategory ss=s.get(i);	             
		             cell = new PdfPCell (new Paragraph (ss.getName(), font2));
		             cell.setBorderWidth(1f);
		             cell.setBorderColor      (BaseColor.GRAY);
		             cell.setPadding (5.0f);  cell.setHorizontalAlignment (Element.ALIGN_CENTER);                             
		             table.addCell(cell);  
		             for(int q=0;q<tag.size();q++)
		 			 {
		            	 
		 				School_Tag t=tag.get(q);
		 				List<String> asses= schoolservice.getmarksheets_assessmentsnewpdf(standard_id,rollno,t1.getId(),t.getId(),ss.getId());
		 				if(asses.isEmpty()){
		 					table.addCell(" ");
		 				}else{
		 					cell = new PdfPCell (new Paragraph (asses.get(0), font2));
			            	cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			            	table.addCell(cell);
		 				}
		 			 }
		             }
		             table.setSpacingBefore(7.0f);       
	                 table.setSpacingAfter(7.0f);         
	                 document.add(table);   
	                
	                
	                 int r=6;if(standard_id>8){r=5;}
	                 School_Maincategory sm1=s.get(r);
	                 String over=schoolservice.getmarksheets_assessmentsnewover(standard_id,rollno);
	                 PdfPTable tableo = new PdfPTable(3);
		             tableo.setWidthPercentage(100);
		             float[] columnWidths0 = {2f,1f,8f};
		             tableo.setWidths(columnWidths0);
		             PdfPCell cell2;	      
		             cell2 = new PdfPCell(new Phrase(sm1.getName(), font1));	            
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setPadding (6.5f);
		             cell2.setBorderWidth(1f);        
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);		             
		             cell2 = new PdfPCell(new Phrase(over,font1));
		            
		             cell2.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setPadding (5.0f);
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);
		             cell2 = new PdfPCell(new Phrase("FINAL = I (10%)+ II (10%)+III (10%)+ IV (10%)+H Y (30%)+ Annual (30%)", font1));	            
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setPadding (6.5f);
		             cell2.setBorderWidth(1f);       
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);
		             tableo.setSpacingBefore(30.0f);      
	                 tableo.setSpacingAfter(5.0f);                                    
	                 document.add(tableo); 
	                
	                 
	                           
	              // Static Table
	                 PdfPTable tabler=new PdfPTable(2);
	                 tabler.setWidthPercentage(100);
	                 PdfPCell cellr = new PdfPCell ();
	                 cellr.setColspan (2);                                           
	                 tabler.addCell(cellr);                                      
	                 PdfPCell cell4 = new PdfPCell ();
	                 PdfPCell cell5 = new PdfPCell ();
	                 
	                 PdfPTable nestedTable = new PdfPTable(2);
	                 nestedTable.setWidthPercentage(99);
	                 nestedTable.setWidths(new int[]{1,2});
	                 nestedTable.setHorizontalAlignment(Element.ALIGN_CENTER);
	               
	                 Font font5 = new Font(FontFamily.HELVETICA, 10);
	                 Font font6 = new Font(FontFamily.HELVETICA, 10, Font.BOLD);
	                 nestedTable.addCell(new Paragraph(("First Term"),font5));
	                 nestedTable.addCell(new Paragraph(("FA1(10%)+FA2(10%)+SA1(30%) = 50%"),font5));
	                 nestedTable.addCell(new Paragraph(("Second Term"),font5));
	                 nestedTable.addCell(new Paragraph(("FA3(10%)+FA4(10%)+SA2(30%) = 50%"),font5));
	                 nestedTable.addCell(new Paragraph(("Formative Assessment"),font5));
	                 nestedTable.addCell(new Paragraph(("FA1(10%)+FA2(10%)+FA3(10%)+FA4(10%) = 40%"),font5));
	                 nestedTable.addCell(new Paragraph(("Summative Assessment"),font5));
	                 nestedTable.addCell(new Paragraph("SA1(30%)+SA2(30%) = 60%",font5));
	                 
	                
	                 

	                 cell4.addElement(nestedTable);
	                 
	                 nestedTable.setSpacingBefore(20.0f);       // Space Before table starts, like margin-top in CSS
	                 nestedTable.setSpacingAfter(10.0f); 
	                 
	                 PdfPTable nestedTable2 = new PdfPTable(3);
	                 nestedTable2.setWidthPercentage(99);
	                 BaseColor base=new BaseColor (59, 89, 152);
	                 
	                 PdfPCell grade=new PdfPCell(new Phrase("Grade",font1));
	                 grade.setBackgroundColor(base);
	                 grade.setBorderColor(BaseColor.GRAY);
	                 grade.setHorizontalAlignment (Element.ALIGN_CENTER);
	                 PdfPCell range=new PdfPCell(new Phrase("Marks Range",font1));
	                 range.setBackgroundColor(base);
	                 range.setBorderColor(BaseColor.GRAY);
	                 range.setHorizontalAlignment (Element.ALIGN_CENTER);
	                 PdfPCell point=new PdfPCell(new Phrase("Grade Point",font1));
	                 point.setBackgroundColor(base);
	                 point.setBorderColor(BaseColor.GRAY);
	                 point.setHorizontalAlignment (Element.ALIGN_CENTER);
	                 
	                 nestedTable2.addCell(grade);
	                 nestedTable2.addCell(range);
	                 nestedTable2.addCell(point);
	                 nestedTable2.addCell(new Paragraph("A1",font2));
	                 nestedTable2.addCell(new Paragraph("91-100",font2));
	                 nestedTable2.addCell(new Paragraph("10.0",font2));
	                 nestedTable2.addCell(new Paragraph("A2",font2));
	                 nestedTable2.addCell(new Paragraph("81-90",font2));
	                 nestedTable2.addCell(new Paragraph("9.0",font2));
	                 nestedTable2.addCell(new Paragraph("B1",font2));
	                 nestedTable2.addCell(new Paragraph("71-80",font2));
	                 nestedTable2.addCell(new Paragraph("8.0",font2));
	                 nestedTable2.addCell(new Paragraph("B2",font2));
	                 nestedTable2.addCell(new Paragraph("61-70",font2));
	                 nestedTable2.addCell(new Paragraph("7.0",font2));
	                 nestedTable2.addCell(new Paragraph("C1",font2));
	                 nestedTable2.addCell(new Paragraph("51-60",font2));
	                 nestedTable2.addCell(new Paragraph("6.0",font2));
	                 nestedTable2.addCell(new Paragraph("C2",font2));
	                 nestedTable2.addCell(new Paragraph("41-50",font2));
	                 nestedTable2.addCell(new Paragraph("5.0",font2));
	                 nestedTable2.addCell(new Paragraph("D1",font2));
	                 nestedTable2.addCell(new Paragraph("33-50",font2));
	                 nestedTable2.addCell(new Paragraph("4.0",font2));
	                 nestedTable2.addCell(new Paragraph("E1",font2));
	                 nestedTable2.addCell(new Paragraph("21-32",font2));
	                 nestedTable2.addCell(new Paragraph("3.0",font2));
	                 nestedTable2.addCell(new Paragraph("E2",font2));
	                 nestedTable2.addCell(new Paragraph("0-20",font2));
	                 nestedTable2.addCell(new Paragraph("2.0",font2));
	                 PdfPCell cellrr;
	                 cellrr = new PdfPCell(new Phrase("* = Denotes Upgradation",font6));
	                 cellrr.setColspan(3);
	                 nestedTable2.addCell(cellrr);
	                 

	                 cell5.addElement(nestedTable2);
	                 nestedTable2.setSpacingBefore(1.0f);       // Space Before table starts, like margin-top in CSS
	                 nestedTable2.setSpacingAfter(30.0f);
	                 tabler.addCell(cell4); 
	                 tabler.addCell(cell5);                 
	                 document.add(tabler);
	                 
	                 
	                 PdfPTable table12 = new PdfPTable(1);
		              table12.setWidthPercentage(100);
		              float[] columnWidths12 = {1f};
		              table12.setWidths(columnWidths12);
		              PdfPCell cell12;	      
		              cell12 = new PdfPCell(new Phrase("(PART-2 CO-SCHOLASTIC AREAS)", font5));	            
		              cell12.setHorizontalAlignment (Element.ALIGN_CENTER);
		              cell12.setPadding (6.5f);
		              cell12.setBorderWidth(0f);       
		             table12.addCell(cell12);
		              table12.setSpacingBefore(7.0f);      
	                 table12.setSpacingAfter(7.0f);                                    
	                 document.add(table12); 
	                 
	                 //pdf cmpl raja
	                 
	                 
	                 
	                 
	                 
	                 
	                 
	               
	       		if(standard_id>8){
	       			
	       		 int c=0;int h=1;
	             for(int i=6;i<s.size();i++){
	                	if(i==13 && h==1){i=14;}
	                	//if(i==9 && h==1){i=10;h=2;}
	                	if(i==12){
	                		  PdfPTable table1 = new PdfPTable(1);
	         	              table1.setWidthPercentage(100);
	         	              float[] columnWidths4 = {1f};
	         	              table1.setWidths(columnWidths4);
	         	              PdfPCell cell3;	      
	         	              cell3 = new PdfPCell(new Phrase("Grading Points: A= 4.1 - 5.0, B=3.1 - 4.0, C=2.1 - 3.0, D=1.1 - 2.0, E=0.0 - 1.0", font1));	            
	         	              cell3.setBorderColor      (BaseColor.GRAY);
	         	              cell3.setHorizontalAlignment (Element.ALIGN_CENTER);
	         	              cell3.setPadding (6.5f);
	         	              cell3.setBorderWidth(1f);       
	         	              cell3.setBackgroundColor (new BaseColor (59, 89, 152));  
	         	              table1.addCell(cell3);
	         	              table1.setSpacingBefore(7.0f);      
	                          table1.setSpacingAfter(7.0f);                                    
	                          document.add(table1); 
	                		
	                	}
	                	
	          		 School_Maincategory sm=s.get(i);
	          		 List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
	          		 int count=3;
	          		if(i==12 || i==13){count=2;}
	          		 PdfPTable table2 = new PdfPTable(count);
	                 table2.setWidthPercentage(100);
	 	             float[] columnWidths2 = {2f,2f,2f};
	 	             float[] columnWidths3 = {2f,2f};
	                 table2.setSpacingBefore(1.0f);       
	                 table2.setSpacingAfter(1.0f);
	                 if(i==12 || i==13){table2.setWidths(columnWidths3);}else{table2.setWidths(columnWidths2);}	                 
	 	             cell = new PdfPCell(new Phrase(sm.getName(), font1));
	 	             cell.setRowspan(1);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setPadding (6.5f);
	 	             cell.setBorderWidth(1f);        
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	 	             table2.addCell(cell);
	 	             if(i==12 || i==13){
	 	            	 cell = new PdfPCell(new Phrase(" ", font1));
			 	         cell.setColspan(1);
			 	         cell.setBorderWidth(1f); 
			 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	         cell.setBorderColor      (BaseColor.GRAY);
			 	         cell.setPadding (5.0f);
			 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
			 	         table2.addCell(cell);
	 	            }else if(i==14){
		 	             cell = new PdfPCell(new Phrase("Term I", font1));
			 	         cell.setColspan(1);
			 	         cell.setBorderWidth(1f); 
			 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	         cell.setBorderColor      (BaseColor.GRAY);
			 	         cell.setPadding (5.0f);
			 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
			 	         table2.addCell(cell);
			 	         cell = new PdfPCell(new Phrase("Term II",font1));
			 	         cell.setColspan(1);
			 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	         cell.setBorderColor      (BaseColor.GRAY);
			 	         cell.setBorderWidth(1f);
			 	         cell.setPadding (5.0f);
			 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));
			 	         table2.addCell(cell);
	 	             }else{
	 	             cell = new PdfPCell(new Phrase("Descriptive Indicator", font1));
		 	         cell.setColspan(1);
		 	         cell.setBorderWidth(1f); 
		 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	         cell.setBorderColor      (BaseColor.GRAY);
		 	         cell.setPadding (5.0f);
		 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		 	         table2.addCell(cell);
		 	         cell = new PdfPCell(new Phrase("Grade",font1));
		 	         cell.setColspan(1);
		 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	         cell.setBorderColor      (BaseColor.GRAY);
		 	         cell.setBorderWidth(1f);
		 	         cell.setPadding (5.0f);
		 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));
		 	         table2.addCell(cell);
	 	             }
	 	            
	 	            //List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());	 	            
	 	           List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgradet(standard_id,rollno,t1.getId(),sm.getId());
	 	          	
	 	           for(int j=0;j<ss.size();j++){	 	           
          			 School_Subcategory sss=ss.get(j);
          			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
          			 cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);                          
	 	             table2.addCell(cell);	
	 	            if(!me1.isEmpty()){
		 	 			for(int l=0;l<ss.size();l++)
		 	 			{
		 	 				School_Subcategory subc=ss.get(l);
		 	 				Marksheets_Evaluation m=me1.get(l);
		 	 				if(subc.getId()!=m.getSkills_id())
		 	 				{
		 	 					Marksheets_Evaluation mm=new Marksheets_Evaluation();
		 	 					mm.setDescription(" ");mm.setGrade(" ");
		 	 					me1.add(l, mm);
		 	 				}					
		 	 			}
		 	 			}
	 	            
	 	           if(me1.isEmpty())
	 	             { 	
	 	             if(i==12 || i==13){table2.addCell(" ");}else{table2.addCell(" ");table2.addCell(" ");}	 	            		          		           			 	             
	 	             }else{
	 	            	Marksheets_Evaluation mer1=me1.get(j);
	 	            	if(i==12 || i==13){	
	 	            		if(i==12){
	 	            			cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
	 	            		}else{
	 	            			cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
	 	            		}
	 	            	 
	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	            	 table2.addCell(cell);
	 	            	}else{
	 	            		if(i==14){
	 	            			cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
	 			 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 			 	             table2.addCell(cell);
	 			 	             Marksheets_Evaluation mer2=me1.get(j);
	 		 	            	 cell = new PdfPCell (new Paragraph (mer2.getGrade(), font2));
	 		 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 			 	             table2.addCell(cell);	 	            			
	 	            		}else{
	 	            	 cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             table2.addCell(cell);
	 	            	 cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             table2.addCell(cell);
	 	            		}}}c++;}   
	 	           			if(i==13 && h==2){i=15;h=3;}
	 	           			if(i==14 && h==1){i=12;h=2;c=c+2;}	 	           			
	 	                  table2.setSpacingBefore(7.0f);      
	 	                  table2.setSpacingAfter(7.0f);                                        
	 	                 document.add(table2);
	             }
	 	            
	             //pdf cmpl raja with small last values
	 	            
	 	          
	             
	             
	             //standard_id>8 cmpl
	       		}else{                           
	                 int c=0;int h=1;
		             for(int i=7;i<s.size();i++){
		                	if(i==14 && h==1){i=15;}
		                	//if(i==9 && h==1){i=10;h=2;}
		                	if(i==13){
		                		  PdfPTable table1 = new PdfPTable(1);
		         	              table1.setWidthPercentage(100);
		         	              float[] columnWidths4 = {1f};
		         	              table1.setWidths(columnWidths4);
		         	              PdfPCell cell3;	      
		         	              cell3 = new PdfPCell(new Phrase("Grading Points: A= 4.1 - 5.0, B=3.1 - 4.0, C=2.1 - 3.0, D=1.1 - 2.0, E=0.0 - 1.0", font1));	            
		         	              cell3.setBorderColor      (BaseColor.GRAY);
		         	              cell3.setHorizontalAlignment (Element.ALIGN_CENTER);
		         	              cell3.setPadding (6.5f);
		         	              cell3.setBorderWidth(1f);       
		         	              cell3.setBackgroundColor (new BaseColor (59, 89, 152));  
		         	              table1.addCell(cell3);
		         	              table1.setSpacingBefore(7.0f);      
		                          table1.setSpacingAfter(7.0f);                                    
		                          document.add(table1); 
		                		
		                	}
		          		 School_Maincategory sm=s.get(i);
		          		 List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
		          		 int count=3;
		          		if(i==13 || i==14){count=2;}
		          		 PdfPTable table2 = new PdfPTable(count);
		                 table2.setWidthPercentage(100);
		 	             float[] columnWidths2 = {2f,2f,2f};
		 	             float[] columnWidths3 = {2f,2f};
		                 table2.setSpacingBefore(1.0f);       
		                 table2.setSpacingAfter(1.0f);
		                 if(i==13 || i==14){table2.setWidths(columnWidths3);}else{table2.setWidths(columnWidths2);}	                 
		 	             cell = new PdfPCell(new Phrase(sm.getName(), font1));
		 	             cell.setRowspan(1);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setPadding (6.5f);
		 	             cell.setBorderWidth(1f);        
		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
		 	             table2.addCell(cell);
		 	             if(i==13 || i==14){
		 	            	 cell = new PdfPCell(new Phrase(" ", font1));
				 	         cell.setColspan(1);
				 	         cell.setBorderWidth(1f); 
				 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				 	         cell.setBorderColor      (BaseColor.GRAY);
				 	         cell.setPadding (5.0f);
				 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
				 	         table2.addCell(cell);
		 	            }else if(i==15){
			 	             cell = new PdfPCell(new Phrase("Term I", font1));
				 	         cell.setColspan(1);
				 	         cell.setBorderWidth(1f); 
				 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				 	         cell.setBorderColor      (BaseColor.GRAY);
				 	         cell.setPadding (5.0f);
				 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
				 	         table2.addCell(cell);
				 	         cell = new PdfPCell(new Phrase("Term II",font1));
				 	         cell.setColspan(1);
				 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				 	         cell.setBorderColor      (BaseColor.GRAY);
				 	         cell.setBorderWidth(1f);
				 	         cell.setPadding (5.0f);
				 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));
				 	         table2.addCell(cell);
		 	             }else{
		 	             cell = new PdfPCell(new Phrase("Descriptive Indicator", font1));
			 	         cell.setColspan(1);
			 	         cell.setBorderWidth(1f); 
			 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	         cell.setBorderColor      (BaseColor.GRAY);
			 	         cell.setPadding (5.0f);
			 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));  
			 	         table2.addCell(cell);
			 	         cell = new PdfPCell(new Phrase("Grade",font1));
			 	         cell.setColspan(1);
			 	         cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	         cell.setBorderColor      (BaseColor.GRAY);
			 	         cell.setBorderWidth(1f);
			 	         cell.setPadding (5.0f);
			 	         cell.setBackgroundColor (new BaseColor (59, 89, 152));
			 	         table2.addCell(cell);
		 	             }
		 	            
		 	            //List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
		 	            List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgradet(standard_id,rollno,t1.getId(),sm.getId());
		 	            List<Marksheets_Evaluation> me3=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());
		 	            List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
		 	           if(!me1.isEmpty()){
			 	 			for(int l=0;l<ss.size();l++)
			 	 			{
			 	 				School_Subcategory subc=ss.get(l);
			 	 				Marksheets_Evaluation m=me1.get(l);
			 	 				if(subc.getId()!=m.getSkills_id())
			 	 				{
			 	 					Marksheets_Evaluation mm=new Marksheets_Evaluation();
			 	 					mm.setDescription(" ");mm.setGrade(" ");
			 	 					me1.add(l, mm);
			 	 				}					
			 	 			}
			 	 			}
		 	          if(!me2.isEmpty()){
			 				if(i!=s.size()-2){
			 				for(int l=0;l<ss.size();l++)
			 				{
			 					School_Subcategory subc=ss.get(l);
			 					Marksheets_Evaluation m=me2.get(l);
			 					if(subc.getId()!=m.getSkills_id())
			 					{
			 						Marksheets_Evaluation mm=new Marksheets_Evaluation();
			 						mm.setDescription(" ");mm.setGrade(" ");
			 						me2.add(l, mm);
			 					}					
			 				}}}
		 				if(!me3.isEmpty()){
		 				for(int l=0;l<ss.size();l++)
		 				{
		 					School_Subcategory subc=ss.get(l);
		 					Marksheets_Evaluation m=me3.get(l);
		 					if(subc.getId()!=m.getSkills_id())
		 					{
		 						Marksheets_Evaluation mm=new Marksheets_Evaluation();
		 						mm.setDescription(" ");mm.setGrade(" ");
		 						me3.add(l, mm);
		 					}					
		 				} 		 				}		
		 				
		 	            for(int j=0;j<ss.size();j++){	 	           
	          			 School_Subcategory sss=ss.get(j);
	          			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
	          			 cell.setBorderWidth(1f); 
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setPadding (5.0f);                          
		 	             table2.addCell(cell);
		 	             if(me1.isEmpty())
		 	             { 	
		 	             if(i==13 || i==14){table2.addCell(" ");}else{table2.addCell(" ");table2.addCell(" ");}	 	            		          		           			 	             
		 	             }else{
		 	            	Marksheets_Evaluation mer1=me1.get(j);
		 	            	if(i==13 || i==14){	
		 	            		if(i==13){
		 	            			cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
		 	            		}else{
		 	            			cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
		 	            		}
		 	            	 
		 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	            	 table2.addCell(cell);
		 	            	}else{
		 	            		if(i==15){
		 	            			Marksheets_Evaluation mer3=me3.get(j);
		 	            			cell = new PdfPCell (new Paragraph (mer3.getGrade(), font2));
		 			 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 			 	             table2.addCell(cell);
		 			 	           Marksheets_Evaluation mer2 = null;
		 			 	             try{
		 			 	            	 mer2=me2.get(j);
		 			 	             
		 		 	            	 cell = new PdfPCell (new Paragraph (mer2.getGrade(), font2));
		 		 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 			 	           }catch(IndexOutOfBoundsException e){
		 			 	            	 System.out.println("Line number 1555:79");
		 			 	             }
		 			 	             table2.addCell(cell);	 	            			
		 	            		}else{
		 	            	 cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
			 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	             table2.addCell(cell);
		 	            	 cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
		 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
			 	             table2.addCell(cell);
		 	            		}}}c++;}   
		 	           			if(i==14 && h==2){i=16;h=3;}
		 	           			if(i==15 && h==1){i=13;h=2;c=c+2;}	 	           			
		 	                  table2.setSpacingBefore(7.0f);      
		 	                  table2.setSpacingAfter(7.0f);                                        
		 	                 document.add(table2);
		 	                 
		                
		             
		             
		             
		             } } 
	             
	       	 //pdf cmpl raja with small last values
            		 
            		 //if id>5 cmpl
            		 }else{
            	 PdfPTable table = new PdfPTable(8);
	             table.setWidthPercentage(100);
	             float[] columnWidths = {4f, 2f, 2f,2f,2f,2f,2f,2f};
	             table.setWidths(columnWidths);	            	             
	             cell = new PdfPCell(new Phrase("ASSESSMENT / SUBJECTS", font1));
	             cell.setRowspan(2);
	             cell.setBorderColor      (BaseColor.GRAY);
	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	             cell.setPadding (6.5f);
	             cell.setBorderWidth(1f);        
	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	             table.addCell(cell);	             
	             cell = new PdfPCell(new Phrase(t1.getName(), font1));
	             cell.setColspan(3);
	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	             cell.setBorderColor      (BaseColor.GRAY);
	             cell.setPadding (5.0f);
	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	             table.addCell(cell);	             
	             cell = new PdfPCell(new Phrase(t2.getName(), font1));
	             cell.setColspan(4); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	             cell.setBorderColor      (BaseColor.GRAY);
	             cell.setBorderWidth(1f);
	             cell.setPadding (5.0f);
	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	             table.addCell(cell);	             
	             List<School_Tag> tag=schoolservice.getschool_tag(standard_id);
	             for(int t=0;t<tag.size();t++){
	            	 School_Tag st=tag.get(t);
	             cell = new PdfPCell (new Paragraph (st.getName(), font1));
	             cell.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	             cell.setBorderColor      (BaseColor.GRAY);
	             cell.setPadding (5.0f);
	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                  
	             table.addCell(cell);    
	             }
	             List<School_Maincategory> s=schoolservice.getSubject(standard_id);
	             
	             
	             if(standard_id==5)
	             {
	            	 for(int i=0;i<6;i++){
	    	             School_Maincategory ss=s.get(i);	             
	    	             cell = new PdfPCell (new Paragraph (ss.getName(), font2));
	    	             cell.setBorderWidth(1f);
	    	             cell.setBorderColor      (BaseColor.GRAY);
	    	             cell.setPadding (5.0f);  cell.setHorizontalAlignment (Element.ALIGN_CENTER);                             
	    	             table.addCell(cell);
	    	             for(int q=0;q<tag.size();q++)
			 			 {
			            	 
			 				School_Tag t=tag.get(q);
			 				List<String> asses= schoolservice.getmarksheets_assessmentsnewpdf(standard_id,rollno,t1.getId(),t.getId(),ss.getId());
			 				if(asses.isEmpty()){
			 					table.addCell(" ");
			 				}else{
			 					cell = new PdfPCell (new Paragraph (asses.get(0), font2));
				            	cell.setHorizontalAlignment (Element.ALIGN_CENTER);
				            	table.addCell(cell);
			 				}
			 			 }
	    	             }
	    	             table.setSpacingBefore(7.0f);       
	                     table.setSpacingAfter(7.0f);         
	                     document.add(table);   
 
	             }else{
	             for(int i=0;i<5;i++){
	             School_Maincategory ss=s.get(i);	             
	             cell = new PdfPCell (new Paragraph (ss.getName(), font2));
	             cell.setBorderWidth(1f);
	             cell.setBorderColor      (BaseColor.GRAY);
	             cell.setPadding (5.0f);  cell.setHorizontalAlignment (Element.ALIGN_CENTER);                             
	             table.addCell(cell);
	             for(int q=0;q<tag.size();q++)
	 			 {
	            	 
	 				School_Tag t=tag.get(q);
	 				List<String> asses= schoolservice.getmarksheets_assessmentsnewpdf(standard_id,rollno,t1.getId(),t.getId(),ss.getId());
	 				if(asses.isEmpty()){
	 					table.addCell(" ");
	 				}else{
	 					cell = new PdfPCell (new Paragraph (asses.get(0), font2));
		            	cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		            	table.addCell(cell);
	 				}
	 			 }
	             }
	             table.setSpacingBefore(7.0f);       
	             table.setSpacingAfter(7.0f);    
                 document.add(table);	             
	             }
	             //raja
	             
	             
	             
	             
	             if(standard_id>2){
	            	 int sid=24;
	            	 String over=schoolservice.getmarksheets_assessmentsnewover(standard_id,rollno);	                 
	             	 //List<String> me3=schoolservice.getoverall(standard_id,rollno,sid);
	                 PdfPTable tableo = new PdfPTable(3);
		             tableo.setWidthPercentage(100);
		             float[] columnWidths0 = {2f,1f,8f};
		             tableo.setWidths(columnWidths0);
		             PdfPCell cell2;	      
		             School_Maincategory sm1=s.get(5);
		             cell2 = new PdfPCell(new Phrase(sm1.getName(), font1));	            
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setPadding (6.5f);
		             cell2.setBorderWidth(1f);        
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);
		             cell2 = new PdfPCell(new Phrase(over,font1));
		             cell2.setBorderWidth(1f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setPadding (5.0f);
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);
		             cell2 = new PdfPCell(new Phrase("FINAL = I (10%)+ II (10%)+III (10%)+ IV (10%)+H Y (30%)+ Annual (30%)", font1));	            
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setPadding (6.5f);
		             cell2.setBorderWidth(1f);       
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             tableo.addCell(cell2);
		             tableo.setSpacingBefore(30.0f);      
	                 tableo.setSpacingAfter(30.0f);                                    
	                 document.add(tableo); 
                 }
	             int c=0;int h=1;
                 if(standard_id>2 && standard_id<5){
                	 for(int i=0;i<s.size();i++){
 	                	if(i==5 ){i=6;}
 	                	if(i==8 && h==1){i=9;h=2;}
 	          		School_Maincategory sm=s.get(i);
 	          		List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
 	          		int count =5;
 	          		if(i>=5){count=3;if(i==8){count=2;}}
 	          		 PdfPTable table2 = new PdfPTable(count);
 	                 table2.setWidthPercentage(100);
 	 	             float[] columnWidths1 = {2f,4f,2f,4f,2f};
 	 	             float[] columnWidths2 = {2f,2f,2f};
 	 	             float[] columnWidths3 = {2f,4f};	 	            
 	                 table2.setSpacingBefore(1.0f);       
 	                 table2.setSpacingAfter(1.0f); 
 	                 if(i<5){table2.setWidths(columnWidths1);}
 	 	             else if(i==8){table2.setWidths(columnWidths3);}else{table2.setWidths(columnWidths2);} 
 	 	             cell = new PdfPCell(new Phrase(sm.getName(), font1));
 	 	             if(i<5){ cell.setRowspan(2);}else{cell.setRowspan(1);}
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setPadding (6.5f);
 	 	             cell.setBorderWidth(1f);        
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
 	 	             table2.addCell(cell);
 	 	             if(i==8){
 	 	            	 cell = new PdfPCell(new Phrase(" ", font1));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setBorderWidth(1f);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
 	 	            	 table2.addCell(cell);
 	 	             }else{
 	 	            	cell = new PdfPCell(new Phrase(t1.getName(), font1));
 		 	             if(i<5){ cell.setColspan(2);}else{cell.setColspan(1);}
 		 	             cell.setBorderWidth(1f); 
 		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
 		 	             table2.addCell(cell);
 		 	             cell = new PdfPCell(new Phrase(t2.getName(),font1));
 		 	             if(i<5){ cell.setColspan(2);}else{cell.setColspan(1);}
 		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setBorderWidth(1f);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
 		 	             table2.addCell(cell);
 	 	             }
 	 	             if(i<5){
 	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                   
 	 	             table2.addCell(cell);                                      
 	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                            
 	 	             table2.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                                     
 	 	             table2.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                
 	 	             table2.addCell(cell);
 	 	             }
 	 	            //List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
 	 	            //List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId());
 	 	            List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());
	 	            List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
	 	           if(!me1.isEmpty()){
 	 	          		for(int l=0;l<ss.size();l++)
 	 	          		{
 	 	          			School_Subcategory subc=ss.get(l);
 	 	          			Marksheets_Evaluation m=me1.get(l);
 	 	          			//System.out.println("subc id::"+subc.getId()+"::skill id::"+m.getSkills_id());
 	 	          			if(subc.getId()!=m.getSkills_id())
 	 	          			{
 	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
 	 	          				mm.setDescription(" ");mm.setGrade(" ");
 	 	          				me1.add(l, mm);
 	 	          			}
 	 	          		}
 	 	          		}
 	 	            	if(!me2.isEmpty()){
 	 	          		if(i!=s.size()-2){
 	 	          		for(int l=0;l<ss.size();l++)
 	 	          		{
 	 	          			School_Subcategory subc=ss.get(l);
 	 	          			Marksheets_Evaluation m=me2.get(l);
 	 	          			if(subc.getId()!=m.getSkills_id())
 	 	          			{
 	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
 	 	          				mm.setDescription(" ");mm.setGrade(" ");
 	 	          				me2.add(l, mm);
 	 	          			}					
 	 	          		}
 	 	          		}}
 	 	            for(int j=0;j<ss.size();j++){ 	 	            	
           			 School_Subcategory sss=ss.get(j);
           			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
           			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                          
 	 	             table2.addCell(cell);	 	             
 	 	             if(me1.isEmpty())
 	 	             {
 	 	            	if(i<5){ table2.addCell(" ");}
 	 	            	table2.addCell(" ");	          		           			 	             
 	 	             }else{
 	 	            	 Marksheets_Evaluation mer1=me1.get(j);
 	 	            	 //System.out.println("desc::"+mer1.getDescription()+"::grade::"+mer1.getGrade()+j);
 	 	            	 cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	            	 if(i<5){table2.addCell(cell);}
 	 	            	 cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             table2.addCell(cell);
 		 	             }
 	 	            if(i!=8){
 	 	             if(me2.isEmpty()){
 	 	            	table2.addCell(" ");
 	 	            	if(i<5){table2.addCell(" ");}	
 	 	             }else{   
 	 	            	 if(c<37){  			 
 	          			 Marksheets_Evaluation mer2=me2.get(j);
 	          			 cell = new PdfPCell (new Paragraph (mer2.getDescription(), font2));
 	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	          			 if(i<5){table2.addCell(cell);}
 	          			 cell = new PdfPCell (new Paragraph (mer2.getGrade(), font2));
 	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 			 	         table2.addCell(cell);
 	 	            
 	 	             }}}c++;} 	  
 	 	            	  if(i==9 && h==2){i=7;h=3;}
 		 	          	  if(i==8 && h==3){i=10;h=3;}            
 	 	                  table2.setSpacingBefore(7.0f);      
 	 	                  table2.setSpacingAfter(7.0f);                                        
 	 	                 document.add(table2);	                
 	                }
                 }else if(standard_id==5){
                	 for(int i=0;i<s.size();i++){
 	                	if(i==6 ){i=7;}
 	                	if(i==9 && h==1){i=10;h=2;}
 	          		School_Maincategory sm=s.get(i);
 	          		List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
 	          		int count =5;
 	          		if(i>5){count=3;if(i==9){count=2;}}
 	          		 PdfPTable table2 = new PdfPTable(count);
 	                 table2.setWidthPercentage(100);
 	 	             float[] columnWidths1 = {2f,4f,2f,4f,2f};
 	 	             float[] columnWidths2 = {2f,2f,2f};
 	 	             float[] columnWidths3 = {2f,4f};	 	            
 	                 table2.setSpacingBefore(1.0f);       
 	                 table2.setSpacingAfter(1.0f); 
 	                 if(i<=5){table2.setWidths(columnWidths1);}
 	 	             else if(i==9){table2.setWidths(columnWidths3);}else{table2.setWidths(columnWidths2);} 
 	 	             cell = new PdfPCell(new Phrase(sm.getName(), font1));
 	 	             if(i<=5){ cell.setRowspan(2);}else{cell.setRowspan(1);}
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setPadding (6.5f);
 	 	             cell.setBorderWidth(1f);        
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
 	 	             table2.addCell(cell);
 	 	             if(i==9){
 	 	            	 cell = new PdfPCell(new Phrase(" ", font1));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setBorderWidth(1f);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
 	 	            	 table2.addCell(cell);
 	 	             }else{
 	 	            	cell = new PdfPCell(new Phrase(t1.getName(), font1));
 		 	             if(i<=5){ cell.setColspan(2);}else{cell.setColspan(1);}
 		 	             cell.setBorderWidth(1f); 
 		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
 		 	             table2.addCell(cell);
 		 	             cell = new PdfPCell(new Phrase(t2.getName(),font1));
 		 	             if(i<=5){ cell.setColspan(2);}else{cell.setColspan(1);}
 		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             cell.setBorderColor      (BaseColor.GRAY);
 		 	             cell.setBorderWidth(1f);
 		 	             cell.setPadding (5.0f);
 		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
 		 	             table2.addCell(cell);
 	 	             }
 	 	             if(i<=5){
 	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                   
 	 	             table2.addCell(cell);                                      
 	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                            
 	 	             table2.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                                     
 	 	             table2.addCell(cell);
 	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
 	 	             cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);
 	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                
 	 	             table2.addCell(cell);
 	 	             }
 	 	            //List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
 	 	            //List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId());
 	 	            List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());
 	 	            List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
 	 	            if(!me1.isEmpty()){
	 	          		for(int l=0;l<ss.size();l++)
	 	          		{
	 	          			School_Subcategory subc=ss.get(l);
	 	          			Marksheets_Evaluation m=me1.get(l);
	 	          			//System.out.println("subc id::"+subc.getId()+"::skill id::"+m.getSkills_id());
	 	          			if(subc.getId()!=m.getSkills_id())
	 	          			{
	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
	 	          				mm.setDescription(" ");mm.setGrade(" ");
	 	          				me1.add(l, mm);
	 	          			}
	 	          		}
	 	          		}
	 	            	if(!me2.isEmpty()){
	 	          		if(i!=s.size()-2){
	 	          		for(int l=0;l<ss.size();l++)
	 	          		{
	 	          			School_Subcategory subc=ss.get(l);
	 	          			Marksheets_Evaluation m=me2.get(l);
	 	          			if(subc.getId()!=m.getSkills_id())
	 	          			{
	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
	 	          				mm.setDescription(" ");mm.setGrade(" ");
	 	          				me2.add(l, mm);
	 	          			}					
	 	          		}
	 	          		}}
	 	            
 	 	            for(int j=0;j<ss.size();j++){ 	 	            	
           			 School_Subcategory sss=ss.get(j);
           			 cell = new PdfPCell (new Paragraph (sss.getName(), font2));
           			 cell.setBorderWidth(1f); 
 	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	             cell.setBorderColor      (BaseColor.GRAY);
 	 	             cell.setPadding (5.0f);                          
 	 	             table2.addCell(cell);	 	             
 	 	             if(me1.isEmpty())
 	 	             {
 	 	            	if(i<=5){ table2.addCell(" ");}
 	 	            	table2.addCell(" ");	          		           			 	             
 	 	             }else{
 	 	            	 Marksheets_Evaluation mer1=me1.get(j);
 	 	            	 cell = new PdfPCell (new Paragraph (mer1.getDescription(), font2));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	 	            	 if(i<=5){table2.addCell(cell);}
 	 	            	 cell = new PdfPCell (new Paragraph (mer1.getGrade(), font2));
 	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 		 	             table2.addCell(cell);
 		 	             }
 	 	            if(i!=9){
 	 	             if(me2.isEmpty()){
 	 	            	table2.addCell(" ");
 	 	            	if(i<=5){table2.addCell(" ");}	
 	 	             }else{   
 	 	            	 if(c<40){  			 
 	          			 Marksheets_Evaluation mer2=me2.get(j);
 	          			 cell = new PdfPCell (new Paragraph (mer2.getDescription(), font2));
 	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 	          			 if(i<=5){table2.addCell(cell);}
 	          			 cell = new PdfPCell (new Paragraph (mer2.getGrade(), font2));
 	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
 			 	         table2.addCell(cell);
 	 	            
 	 	             }}}c++;} 	  
 	 	            	  if(i==10 && h==2){i=8;h=3;}
 		 	          	  if(i==9 && h==3){i=11;h=3;}            
 	 	                  table2.setSpacingBefore(7.0f);      
 	 	                  table2.setSpacingAfter(7.0f);                                        
 	 	                 document.add(table2);	                
 	                }
                	 //standard_id==5
                 }else{	             
	                for(int i=0;i<s.size();i++){
	                	if(i==7 && h==1){i=8;h=2;}
	          		School_Maincategory sm=s.get(i);
	          		List<School_Subcategory> ss=schoolservice.getSubcategory(sm.getId());
	          		int count =5;
	          		if(i>=5){count=3;if(i==7){count=2;}}
	          		 PdfPTable table2 = new PdfPTable(count);
	                 table2.setWidthPercentage(100);
	 	             float[] columnWidths1 = {2f,4f,2f,4f,2f};
	 	             float[] columnWidths2 = {2f,2f,2f};
	 	             float[] columnWidths3 = {2f,4f};	 	            
	                 table2.setSpacingBefore(1.0f);      
	                 table2.setSpacingAfter(1.0f); 
	                 if(i<5){table2.setWidths(columnWidths1);}else if(i==7){table2.setWidths(columnWidths3);}else{table2.setWidths(columnWidths2);} 	 	                         
	 	             cell = new PdfPCell(new Phrase(sm.getName(), font1));
	 	             if(i<5){ cell.setRowspan(2);}else{cell.setRowspan(1);}
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setPadding (6.5f);
	 	             cell.setBorderWidth(1f);       
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	 	             table2.addCell(cell);
	 	             if(i==7){
	 	            	 cell = new PdfPCell(new Phrase(" ", font1));
	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setBorderWidth(1f);
		 	             cell.setPadding (5.0f);
		 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
	 	            	 table2.addCell(cell);
	 	             }else{
	 	             cell = new PdfPCell(new Phrase(t1.getName(), font1));
	 	             if(i<5){ cell.setColspan(2);}else{cell.setColspan(1);}
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	 	             table2.addCell(cell);
	 	             cell = new PdfPCell(new Phrase(t2.getName(),font1));
	 	             if(i<5){ cell.setColspan(2);}else{cell.setColspan(1);}
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setBorderWidth(1f);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
	 	             table2.addCell(cell);	
	 	             }
	 	             if(i<5){
	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                   
	 	             table2.addCell(cell);                                      
	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                            
	 	             table2.addCell(cell);
	 	             cell = new PdfPCell (new Paragraph ("Descriptive Indicator",font1));
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f); cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                                     
	 	             table2.addCell(cell);
	 	             cell = new PdfPCell (new Paragraph ("Grade",font1));
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));                                
	 	             table2.addCell(cell);
	 	             }
		 	        //List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId());
	 	            //List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId());
	 	             int t2id=t2.getId();
	 	             int smid=sm.getId();
	 	             
	 	            List<Marksheets_Evaluation> me1=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());
	 	            System.out.println(standard_id+" "+rollno+" "+t2id+" "+smid+"<<<<<<<<<<<<<<<<<<<<<<<<<***************************>>>>>>>>>>>>>>>>>>>>");
 	 	            List<Marksheets_Evaluation> me2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
 	 	            if(!me1.isEmpty()){
	 	          		for(int l=0;l<ss.size();l++)
	 	          		{
	 	          			School_Subcategory subc=ss.get(l);
	 	          			try{
	 	          			Marksheets_Evaluation m=me1.get(l);
	 	          			//System.out.println("subc id::"+subc.getId()+"::skill id::"+m.getSkills_id());
	 	          			
	 	          				if(subc.getId()!=m.getSkills_id())
		 	          			{
		 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
		 	          				mm.setDescription(" ");mm.setGrade(" ");
		 	          				me1.add(l, mm);
		 	          			}
	 	          			}catch(Exception e){
	 	          				e.printStackTrace();
	 	          			}
	 	          		}
	 	          		}
	 	            	if(!me2.isEmpty()){
	 	          		if(i!=s.size()-2){
	 	          		for(int l=0;l<ss.size();l++)
	 	          		{
	 	          			School_Subcategory subc=ss.get(l);
	 	          			try{
	 	          				Marksheets_Evaluation m=me2.get(l); 
		 	          			if(subc.getId()!=m.getSkills_id())
		 	          			{
		 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
		 	          				mm.setDescription(" ");mm.setGrade(" ");
		 	          				me2.add(l, mm);
		 	          			}	
	 	          			}catch(IndexOutOfBoundsException ne){
	 	          				ne.printStackTrace();
	 	          			}
	 	          		}
	 	          		}}
	 	            for(int j=0;j<ss.size();j++){
	 	            	if(!me1.isEmpty()){
	 	 	          		for(int l=0;l<ss.size();l++)
	 	 	          		{
	 	 	          			
	 	 	          			try{
	 	 	          			School_Subcategory subc=ss.get(l);
	 	 	          			Marksheets_Evaluation m=me1.get(l);
	 	 	          			System.out.println("subc id::"+subc.getId()+"::skill id::"+m.getSkills_id());
	 	 	          			if(subc.getId()!=m.getSkills_id())
	 	 	          			{
	 	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
	 	 	          				mm.setDescription(" ");mm.setGrade(" ");
	 	 	          				me1.add(l, mm);
	 	 	          			}}
	 	 	          			catch(IndexOutOfBoundsException e){
	 	 	          				e.printStackTrace();
	 	 	          			}
	 	 	          		}
	 	 	          		}
	 	 	            	if(!me2.isEmpty()){
	 	 	          		if(i!=s.size()-2){
	 	 	          		for(int l=0;l<ss.size();l++)
	 	 	          		{
	 	 	          			School_Subcategory subc=ss.get(l);
	 	 	          			try{
	 	 	          			Marksheets_Evaluation m=me2.get(l);
	 	 	          			if(subc.getId()!=m.getSkills_id())
	 	 	          			{
	 	 	          				Marksheets_Evaluation mm=new Marksheets_Evaluation();
	 	 	          				mm.setDescription(" ");mm.setGrade(" ");
	 	 	          				me2.add(l, mm);
	 	 	          			}
	 	 	          			}catch(IndexOutOfBoundsException e){
	 	 	          				e.printStackTrace();
	 	 	          			}
	 	 	          		}
	 	 	          		}}
          			 School_Subcategory sss=ss.get(j);     
          			 cell = new PdfPCell (new Paragraph (sss.getName(),font2));
          			 cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);                          
	 	             table2.addCell(cell);	 	             
	 	             if(me1.isEmpty())
	 	             {
	 	            	if(i<5){ table2.addCell(" ");}
	 	             table2.addCell(" ");	          		           			 	             
	 	             }else{
	 	            	 try{
	 	            	 Marksheets_Evaluation mer1=me1.get(j);
	 	            	 cell = new PdfPCell (new Paragraph (mer1.getDescription(),font2));
	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	            	 if(i<5){table2.addCell(cell);}
	 	            	 cell = new PdfPCell (new Paragraph (mer1.getGrade(),font2));
	 	            	 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	            	 }
	 	            	 catch(IndexOutOfBoundsException e){
	 	            		 System.out.println("Line 2208");
	 	            		 ///e.printStackTrace();
	 	            	 }
		 	             table2.addCell(cell);
		             }
	 	             if(i!=7){
	 	             if(me2.isEmpty()){
	 	            	table2.addCell(" ");
	 	            	if(i<5){table2.addCell(" ");}	
	 	             }else{   
	 	            	 if(c<35){ 
	 	            		 try{
	          			 Marksheets_Evaluation mer2=me2.get(j);
	          			 cell = new PdfPCell (new Paragraph (mer2.getDescription(),font2));
	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	          			 if(i<5){table2.addCell(cell);}
	          			 cell = new PdfPCell (new Paragraph (mer2.getGrade(),font2));
	          			 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	            		 }catch(IndexOutOfBoundsException e){
	 	            			 System.out.println("Line 2227");
	 	            		 }
			 	         table2.addCell(cell);
	 	             }else{
	 	            	if(i<5){table2.addCell(" ");}
			 	        table2.addCell(" ");
	 	             }}}c++;} 	  
	 	            	  if(i==8 && h==2){i=6;h=3;}
		 	          	  if(i==7 && h==3){i=9;h=3;}            
	 	                  table2.setSpacingBefore(7.0f);       
	 	                  table2.setSpacingAfter(7.0f);                                                  
	 	                 document.add(table2);	                
	                }
	                
                 }
	             }
	                
	                
	                
	                
	                List<String> ms=schoolservice.getmarksheets_studentresults(standard_id,rollno);
	        		List<Marksheets_Studentremarks> msr=schoolservice.getmarksheets_studentremarks(standard_id,rollno);
	        		System.out.println(standard_id+" "+rollno);
	                PdfPTable table3 = new PdfPTable(2);
		             table3.setWidthPercentage(100);
		             float[] columnWidths2 = {1f, 8f};
		             table3.setWidths(columnWidths2);
		             PdfPCell cell2;		             
		             cell2 = new PdfPCell(new Phrase("Result", font1));		            
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setPadding (6.5f);
		             cell2.setBorderWidth(1f);     
		             cell2.setBackgroundColor (new BaseColor (59, 89, 152));  
		             table3.addCell(cell2);
		             if(ms.isEmpty())
		             {
		            	 cell2 = new PdfPCell(new Phrase(" "));
		             }else{
		             cell2 = new PdfPCell(new Phrase(ms.get(0),font2));
		             }
		             cell2.setBorderWidth(1f); cell2.setHorizontalAlignment (Element.ALIGN_CENTER);
		             cell2.setBorderColor      (BaseColor.GRAY);
		             cell2.setPadding (5.0f); 
		             table3.addCell(cell2);		             
		             table3.setSpacingBefore(30.0f);       
	                 table3.setSpacingAfter(30.0f);                                                  
	                 document.add(table3);
	                 PdfPTable table4 = new PdfPTable(3);
	                 table4.setWidthPercentage(100);
	 	             float[] columnWidths1 = {2f,2f,2f};
	 	             table4.setWidths(columnWidths1); 
	                 table4.setSpacingBefore(1.0f);     
	                 table4.setSpacingAfter(1.0f); 
	                 table4.setWidths(columnWidths1);
	 	             cell = new PdfPCell(new Phrase(" Director ", font1));
	 	             cell.setRowspan(1);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setPadding (6.5f);
	 	             cell.setBorderWidth(1f);       
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	 	             table4.addCell(cell);
	 	             cell = new PdfPCell(new Phrase(" Coordinator ", font1));
	 	             cell.setColspan(1);
	 	             cell.setBorderWidth(1f); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));  
	 	             table4.addCell(cell);
	 	             cell = new PdfPCell(new Phrase(" Class Teacher ",font1));
	 	             cell.setColspan(1); 
	 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
	 	             cell.setBorderColor      (BaseColor.GRAY);
	 	             cell.setBorderWidth(1f);
	 	             cell.setPadding (5.0f);
	 	             cell.setBackgroundColor (new BaseColor (59, 89, 152));
	 	             table4.addCell(cell);	 	           
	 	             if(msr.isEmpty())
	 	             {System.out.println("In  if pdfffff>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	 	            	 cell = new PdfPCell (new Paragraph (" "));
	         			 cell.setBorderWidth(1f); 
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setPadding (5.0f);                             
		 	             table4.addCell(cell);
		 	             table4.addCell(" ");
		 	             table4.addCell(" ");
	 	             }else{System.out.println("In  else pdfffff>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	 	            	 Marksheets_Studentremarks msrs=msr.get(0);
	 	            	System.out.println(msrs.getBy_principal());
	 	            	 cell = new PdfPCell (new Paragraph (msrs.getBy_principal(),font2));
	 	            	 
	         			 cell.setBorderWidth(1f); 
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setPadding (5.0f);                             
		 	             table4.addCell(cell);
		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_coordinator(),font2));
	        			 cell.setBorderWidth(1f); 
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setPadding (5.0f);                             
		 	             table4.addCell(cell);
		 	             cell = new PdfPCell (new Paragraph (msrs.getBy_class_teacher(),font2));
	        			 cell.setBorderWidth(1f); 
		 	             cell.setHorizontalAlignment (Element.ALIGN_CENTER);
		 	             cell.setBorderColor      (BaseColor.GRAY);
		 	             cell.setPadding (5.0f);                             
		 	             table4.addCell(cell);
	 	            }
	 	                  table4.setSpacingBefore(7.0f);     
	 	                  table4.setSpacingAfter(7.0f);                                                
	 	                  document.add(table4); 
	 	                  document.add(Chunk.NEWLINE); 
	 	                  
            		}
		  	} catch (Exception e) {
		  			e.printStackTrace();
		  		}
		  	finally{
		  		document.close();
		  	}
		
	}
	@RequestMapping(value="/test")
	public String test(){
		return null;
		
	}
	
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping(value="/email", method=RequestMethod.GET)
	public String email(HttpServletRequest req) {
        String content = "Hi, Please Check The Following Attachment"; 
        String subject = "Regarding Marks Report";
        ByteArrayOutputStream outputStream = null;
        String to_email=req.getParameter("tomail");
        String cc_email=req.getParameter("ccmail");
        System.out.println("cc_email"+cc_email);
        String dob=req.getParameter("dob");
		String standard= req.getParameter("standard");
		String student_name= req.getParameter("student_name");
		String year= req.getParameter("year");
		System.out.println(year+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		int standard_id= Integer.parseInt(req.getParameter("standard_id"));
		int rollno= Integer.parseInt(req.getParameter("rollno"));
		try {   
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(content);
           outputStream = new ByteArrayOutputStream();
           getPdf1st(outputStream, req, standard_id,dob,student_name,rollno,standard, year );
           byte[] bytes = outputStream.toByteArray();
           DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");   
            MimeMessage msg =  mailSender.createMimeMessage();        	  
	        MimeMessageHelper helper = new MimeMessageHelper(msg, true);
	        if(cc_email.equals("")){
	        	helper.setTo(to_email);
	        }else
	        {
	        	helper.setTo(to_email); 
		        helper.addBcc(cc_email);
	        }
	        
	        helper.setSubject(subject);  
	        helper.setText(content); 
	        helper.addAttachment("MarkSheet.pdf", dataSource); 
	        mailSender.send(msg);
        } catch(Exception ex) {
        	System.out.println("In mail fail catch block");
            ex.printStackTrace();
            return "mail_failure";
        } finally {
            //if(null != outputStream) {
               // try { outputStream.close(); outputStream = null; }
               // catch(Exception ex) { }
            //}
        }
        return "mail_success";     
    }
	}
