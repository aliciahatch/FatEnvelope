Rails3BootstrapDeviseCancan::Application.routes.draw do
  




  get "appointments/index"

  resources :bootcamps

  get "pages/essay-system", :to => "pages#essaysystem", :as => "essaysystem"
  get "pages/success-stories", :to => "pages#successstories", :as => "successstories"
  get "pages/program-costs", :to => "pages#programcosts", :as => "programcosts"
  get "pages/private-tutoring", :to => "pages#tutoring", :as => "tutoring"
  get "pages/faq", :to => "pages#faq", :as => "faq"
  get "pages/about", :to => "pages#about", :as => "about"
  get "pages/bootcamp", :to => "pages#bootcamp", :as => "advisors"
  get "pages/tiger-moms", :to => "pages#tigermoms", :as => "tigermoms"
  get "pages/contact", :to => "pages#contact", :as => "contact"
  get "pages/terms", :to => "pages#terms", :as => "terms"

  mount Ckeditor::Engine => '/ckeditor'

  get "program/index"

  match "program_overview/:id" => "program_overview#index"
  match "course/:schoolId/:id" => "program#index"
  
  mount Ckeditor::Engine => "/ckeditor"


  resources :program_manifests

  resources :step_types

  resources :steps

  resources :programs

  get "schedule/index"

  get "schedule/edit"

  get "getting_started", :to => "getting_started#index", :as => "getting_started"
  get "getting_started/index"

  post "pick_school/new"
  get "pick_school/index"

  resources :schools
  post "schools/delete_school_relation"

  get "marketing/index"

  get "marketing/about"

  resources :plans

  get "plans/index"

  get "plans/new"
  
  get "program/addCompletedStep"
  
  get "home", :to => "home#index", :as => "home"
  
  get "dashboard", :to => "dashboard#index", :as => "dashboard"
  get "dashboard/index"

  resources :subscriptions    

  root :to => "marketing#index"
  devise_for :users
  get "user/edit/:id" => "user#edit"
 
  match 'users/dashboard' => "users#dashboard"
  match 'users/bootcamp_welcome' => "users#bootcamp_welcome"
  match 'users/panam_login' => "users#panam_login"
  match 'appointments/book' => 'appointments#book'
  match 'appointments/make_available' => 'appointments#make_available'
  match 'appointments/make_unavailable' => 'appointments#make_unavailable'
  match 'appointments/all' => 'appointments#all'
  resources :users do
    resources :appointments
  end
  resources :appointments

	match "registration/new" => "registration#new"
	match "registration/pending" => "registration#pending"
	match "registration/successful" => "registration#successful"
	match "registration/add_details" => "registration#add_details"
	match "registration/update_details" => "registration#update_details"
	match "registration/validate_user" => "registration#validate_user"
	match "registration/validate_code" => "registration#validate_code"
	match "registration/charge_and_create_user" => "registration#charge_and_create_user"

end
