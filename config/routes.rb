Rails.application.routes.draw do
  resources :queries
  resources :feedbacks
  resources :teams
  resources :eventslots
  resources :eventschedules
  resources :events
  resources :messages do 
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/viewallevents', :to=> 'pages#viewAllEvents'
  get '/viewfeedback', :to=> 'pages#viewFeedback'
  get '/viewqueries', :to=> 'pages#viewQueries'
  get 'register/:string' => 'teams#new', as: :register_event
  get '/vieweventschedule', :to=> 'pages#viewEventSchedule'
  get 'askQuery', :to => 'queries#index'
  get '/vieweventslots/:event_schedule_id', :to=> 'pages#viewEventSlots', as: :vieweventslot
  get 'eventslot/:event_schedule_id' => 'eventslots#new', as: :event_slot_new
  get 'giveFeedback', :to => "feedbacks#new"
  get 'noticeBoard', :to=> "messages#index"
  # get '/respondquery', :to=> 'queries#respondQuery'
end
