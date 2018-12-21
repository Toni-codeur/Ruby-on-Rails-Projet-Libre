module StatiqueHelper
  def full_title(page_title = "")
    base_title = "Tutoriel RoR Udemy"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
