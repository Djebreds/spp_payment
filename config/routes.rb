Rails.application.routes.draw do
  devise_for :students, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'students/sessions' } 
  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'admins/sessions' }
  
  devise_scope :student do
    authenticated :student do
      namespace :students do
        get 'dashboard/index', as: :authenticated_root
        get 'dashboard/history', to: 'history_payments#index'
      end
    end
  end

  devise_scope :admin do
    authenticated :admin do
      namespace :admins do
        namespace :admin do
          get 'dashboard/index', as: :authenticated_root
          get 'payments/index'
          resources :payment_methods, except: :show
          get 'payments/update_budget', to: 'payments#update_budget'
          get 'payments/update_monthly', to: 'payments#update_monthly'
          resources :payments
          resources :generations, except: :show do
            resources :budget_spps, except: :show do
              resources :monthly_spps, only: [:index, :edit, :update]
            end
          end
          namespace :categories do
            resources :majors, except: :show
            resources :class_rooms, except: :show do
              resources :class_room_majors, except: :show
            end
          end
          namespace :users do
            resources :staffs
            resources :students
            resources :admins, only: [:index, :show]
          end
        end
        namespace :staff do
          get 'dashboard/index', as: :authenticated_root, to: 'dashboard#index'
          resources :payments
          get 'dashboard/history', to: 'history_payments#index'
        end
      end
    end
  end

  root to: 'pages#index'
end
