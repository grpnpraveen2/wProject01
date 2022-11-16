Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'

  get 'enrolled/students/in/course/:course_id', to: 'enrolled#enrolled_students'
  get 'course_schedule/active/course/:date', to: 'course_schedule#active_courses'
  get 'course_schedule/students/count/withId/:id', to: 'course_schedule#student_count'
  # get 'students/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index,:create,:destroy,:update]
  resources :courses, only: [:index,:create,:destroy,:update]
  resources :course_schedule, only: [:index,:create,:destroy,:update]
  resources :enrolled, only: [:index,:create,:destroy,:update]
end
