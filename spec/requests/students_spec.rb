require 'rails_helper'

describe  'Courses API', type: :request do 
    

    describe 'GET /courses' do
        it "returns all students" do 

            FactoryBot.create(:student,first_name: "om0",last_name: "rauth12",dob:"2000-01-03")
            FactoryBot.create(:student,first_name: "om023",last_name: "rauth45",dob:"2003-04-06")
            FactoryBot.create(:student,first_name: "om0231",last_name: "rauth76",dob:"2005-11-01")


            get '/students'

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(3)
        end
    end

    describe 'POST /students' do
        it 'creates a new student' do
    
            expect{

                post '/students', params: {student: {first_name: "fname123",last_name: "lname123",dob:"2000-01-03"}}
            }.to change{Student.count}.from(0).to(1)
            expect(response).to have_http_status(:created)

        end
    end

    describe 'DELETE /students/:id' do
    
        

        it 'deletes a student' do
        
            student=FactoryBot.create(:student,first_name: "om0231",last_name: "rauth76",dob:"2005-11-01")

            expect { delete "/students/#{student.id}" }.to change{Student.count}.from(1).to(0)
           
            expect(response).to have_http_status(:accepted)

        end

    end


    describe 'PUT /students/:id' do
    
        

        it 'edits a student' do
        
            student=FactoryBot.create(:student,first_name: "om0231",last_name: "rauth76",dob:"2005-11-01")

            expect { put "/students/#{student.id}", params: {student: {first_name: "om123",last_name: "rauth",dob:"2005-11-01"}} }.to change{Student.find(student.id).first_name}.to eq("om123")
           
            expect(response).to have_http_status(:accepted)

        end

    end

end 

