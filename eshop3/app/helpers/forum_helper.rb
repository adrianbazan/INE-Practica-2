module ForumHelper
  def display_like_a_tree(posts)
    content = ''
    for post in posts
      url = link_to "#{h post.subject}", { :action => 'show', :id => post.id }
      button = button_to 'Eliminar', { :action => 'destroy', :method => 'post', :id => post },
	       data: { confirm: "¿Estás seguro de que quieres borrar el post #{post.subject}?"}
      margin_left = post.depth * 30;
      content << %(
       		   <tr><td><div style="margin-left:#{margin_left}px">
  		   #{url} creado por #{h post.name} &middot; #{post.created_at.strftime "%H:%M:%S %d-%m-%Y"}</div></td>)
      content << %(
		   <td>#{button}</td>) unless post.parent_id != 0
      content << %(</tr>)
    end
    content.html_safe
  end
end
