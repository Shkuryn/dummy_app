module ProductsHelper
  def page_nav(pagy)
    link = pagy_link_proc(pagy)
    p_prev = pagy.prev
    p_next = pagy.next

    html = +%(<nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">)
    html << if p_prev
              %(<span class="page prev relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-l-lg md text-gray-700 bg-white hover:bg-gray-50 flex justify-between sm:px-2" >
               #{link.call p_prev,
                           '<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                 <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                           </svg>', 'aria-label="previous" '} </span>)
            else
              %(<span class="page prev disabled relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-l-lg md text-gray-700 bg-white hover:bg-gray-50 flex justify-between sm:px-2" >
               #{link.call p_prev,
                           '<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                 <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                           </svg>', 'aria-label="previous" '} </span>)

            end

    pagy.series.each do |item|
      # series example: [1, :gap, 7, 8, "9", 10, 11, :gap, 36]
      html << case item
              when Integer then %(<span class="page border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">#{link.call item}</span> ) # page link
              when String then %(<span class="page active z-10 bg-indigo-50 border-indigo-500 text-indigo-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium"">#{item}</span> ) # current page
              when :gap then %(<span class="page gap border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">#{pagy_t('pagy.nav.gap')}</span> ) # page gap
              end
    end
    html << if p_next
              %(<span class="page next  relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-lg text-gray-700 bg-white hover:bg-gray-50">
               #{link.call p_next,
                           ' <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                  <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                            </svg>', 'aria-label="next" '}</span>)
            else
              %(<span class="page next disabled relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-lg text-gray-700 bg-white hover:bg-gray-50">
               #{link.call p_next,
                           ' <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                  <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                            </svg>', 'aria-label="next" '}</span>)
            end
    html << %(</nav>)
  end
end
