require 'rails_helper'

describe "CourseSchedules", type: :request do
  describe 'GET /course_schedule' do
    it "returns all course_schedule" do 
        course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)

        FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)

        get '/course_schedule'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(1)
    end
  end

describe 'POST /course_schedule' do
    it 'creates a new course_schedule' do

        course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)
        expect{
            post '/course_schedule', params: {course_schedule: {start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id}}
        }.to change{CourseSchedule.count}.from(0).to(1)
        expect(response).to have_http_status(:created)

    end
end

describe 'DELETE /course_schedule/:id' do

    

    it 'deletes a course_schedule' do
    
      course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)

      course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)

        expect { delete "/course_schedule/#{course_schedule.id}" }.to change{CourseSchedule.count}.from(1).to(0)
       
        expect(response).to have_http_status(:accepted)

    end

end


describe 'PUT /course_schedule/:id' do

    

    it 'edits a course_schedule' do
    
      course=FactoryBot.create(:course,course_name: "om04",duration: "23",active: true)

      course_schedule=FactoryBot.create(:course_schedule,start_date:"2005-11-01",end_date:"2005-12-01",total_seats:34,course_id:course.id)

        expect { put "/course_schedule/#{course_schedule.id}", params: {course_schedule: {start_date:"2005-11-01",end_date:"2005-12-01",total_seats:33,course_id:course.id}} }.to change{CourseSchedule.find(course_schedule.id).total_seats}.to eq(33)
       
        expect(response).to have_http_status(:accepted)

    end

end
end
