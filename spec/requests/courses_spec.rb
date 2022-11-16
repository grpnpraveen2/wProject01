require 'rails_helper'

describe  'Courses API', type: :request do 
    
    describe 'GET /courses' do
        it "returns all courses" do 

            FactoryBot.create(:course,course_name: "om0",duration: "56",active: true)
            FactoryBot.create(:course,course_name: "om2",duration: "34",active: false)
            FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
            

            get '/courses'

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(3)
        end
    end

        
    describe 'POST /courses' do
    
        it 'creates a new course' do
    
            expect{

                post '/courses', params: {course: {course_name: "cyber123",duration: "40",active: true}}
            }.to change{Course.count}.from(0).to(1)
            expect(response).to have_http_status(:created)

        end

    end

    describe 'DELETE /courses/:id' do
    
        

        it 'deletes a course' do
        
            course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)

            expect { delete "/courses/#{course.id}" }.to change{Course.count}.from(1).to(0)
           
            expect(response).to have_http_status(:accepted)

        end

    end

    describe 'PUT /courses/:id' do
    
        

        it 'edits a course' do
        
            course=FactoryBot.create(:course,course_name: "om0231",duration: "10",active:true)

            expect { put "/courses/#{course.id}", params: {course: {course_name: "om0231",duration: "10",active:false}} }.to change{Course.find(course.id).active}.to eq(false)
           
            expect(response).to have_http_status(:accepted)

        end

    end

end 

