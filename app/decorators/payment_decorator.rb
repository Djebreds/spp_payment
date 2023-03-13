class PaymentDecorator < ApplicationDecorator
  include ActionView::Helpers::NumberHelper
  delegate_all

   # def created_at
  #   h.content_tag :span, class: 'time' do 
  #     object.created_at.strftime("%A, %e %B %Y %H:%M:%S %p")
  #   end
  # end

  # def updated_at
  #   h.content_tag :span, class: 'time' do 
  #     object.updated_at.strftime("%A, %e %B %Y %H:%M:%S %p")
  #   end
  # end
  def status
    case object.status
    when 'initial'
      h.content_tag(:span, object.status, class: "badge rounded-pill bg-info")
    when 'arrears'
      h.content_tag(:span, object.status, class: "badge rounded-pill bg-warning")
    when 'completed'
      h.content_tag(:span, object.status, class: "badge rounded-pill bg-success")
    end
  end

  def total
    number_to_currency(object.total, unit: "Rp. ", separator: ",", delimiter: ".")
  end

  def year_total
    number_to_currency(object.year_total, unit: "Rp. ", separator: ",", delimiter: ".")
  end

  def DT_actions
    header = '<div class="d-flex gap-2">'.html_safe
      show = h.link_to '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-fill" viewBox="0 0 16 16">
      <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5h16V4H0V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5z"/>
       </svg>'.html_safe, h.admins_admin_payment_path(object.id), class: "btn btn-primary"

      edit = h.link_to '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
      <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
      </svg>'.html_safe, { action: :edit, id: object.id } , class: "btn btn-warning"
      
      delete = h.button_to "<svg data-payment-id='#{object.id}' xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'>
      <path data-payment-id='#{object.id}' d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/>
      </svg>".html_safe, { action: :destroy, id: object.id }, form: { id: "delete-payment-#{object.id}" }, method: :delete, class: "btn btn-danger payment", data: { budget_spp_id: object.id }
    
    footer = '</div>'.html_safe       
    h.safe_join([header, show, edit, delete, footer], '')
  end
end
