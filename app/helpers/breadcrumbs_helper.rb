module BreadcrumbsHelper
  def build_breadcrumbs(page_title, parents = [])
    html = ''
    html << content_tag(:h1, page_title, class: 'page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0')
    html << content_tag(:ul, home_link + parents_links(parents) + separator + current_page(page_title),
                        class: 'breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1')
    html.html_safe
  end

  private

  def separator
    content_tag :li, class: 'breadcrumb-item' do
      tag.span class: 'bullet bg-gray-400 w-5px h-2px'
    end
  end

  def home_link
    content_tag :li, class: 'breadcrumb-item text-muted' do
      link_to t('home'), root_path, class: 'text-muted text-hover-primary'
    end
  end

  def parents_links(parents)
    return unless parents.any?

    parents.each do |parent|
      separator
      content_tag 'li', class: 'breadcrumb-item' do
        link_to parent[:title], parent[:path], class: 'text-muted text-hover-primary'
      end
    end
  end

  def current_page(page_title)
    content_tag :li, page_title, class: 'breadcrumb-item text-muted'
  end
end
