module ApplicationHelper
  def single_field_confirm_btn
    button_tag(class: 'bg-green-100 hover:bg-green-200 p-4 rounded-md') do
      inline_svg 'check.svg'
    end
  end
end
