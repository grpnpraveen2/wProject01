require 'rails_helper'

describe "Enrolleds", type: :request do

    describe 'GET /enrolled' do
        it "returns all enrolled" do 

            course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
            course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)
            student=FactoryBot.create(:student,first_name: "om0",last_name: "rauth12",dob:"2000-01-03")

            
            FactoryBot.create(:enrolled,status:"fine",student_id:student.id,course_schedule_id:course_schedule.id)
                
                
    
            get '/course_schedule'
    
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(1)
        end
    end

    describe 'POST /enrolled' do
        it 'creates a new enrolled' do
    
            course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
            course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)
            student=FactoryBot.create(:student,first_name: "om0",last_name: "rauth12",dob:"2000-01-03")

            expect{
                post '/enrolled', params: {enrolled: {status:"fine",student_id:student.id,course_schedule_id:course_schedule.id}}
            }.to change{Enrolled.count}.from(0).to(1)
            expect(response).to have_http_status(:created)
    
        end
    end

    describe 'DELETE /enrolled/:id' do
        it 'deletes a enrolled' do
        
            course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
            course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)
            student=FactoryBot.create(:student,first_name: "om0",last_name: "rauth12",dob:"2000-01-03") 
            enrolled=FactoryBot.create(:enrolled,status:"fine",student_id:student.id,course_schedule_id:course_schedule.id)
          
    
            expect { delete "/enrolled/#{enrolled.id}" }.to change{Enrolled.count}.from(1).to(0)
           
            expect(response).to have_http_status(:accepted)
    
        end
    
    end


    describe 'PUT /enrolled/:id' do

    

        it 'edits a enrolled' do

            course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
            course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)
            student=FactoryBot.create(:student,first_name: "om0",last_name: "rauth12",dob:"2000-01-03") 
            enrolled=FactoryBot.create(:enrolled,status:"fine",student_id:student.id,course_schedule_id:course_schedule.id)
          
            expect { put "/enrolled/#{enrolled.id}", params: {enrolled: {status:"fin",student_id:student.id,course_schedule_id:course_schedule.id}}}.to change{Enrolled.find(enrolled.id).status}.to eq("fin")
           
            expect(response).to have_http_status(:accepted)
    
        end
    
    end
end
