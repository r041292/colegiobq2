

    // This is the first thing we add ------------------------------------------
    $(document).ready(function() {
        
        $('.rate_widget').each(function(i) {
            var widget = this;
            var out_data = {
                widget_id : $(widget).attr('id'),
                fetch: 1
            };
        });
    

        $('.ratings_stars').hover(
            // Handles the mouseover
            function() {
                $(this).prevAll().andSelf().addClass('ratings_over');
                $(this).nextAll().removeClass('ratings_vote'); 
            },
            // Handles the mouseout
            function() {
                $(this).prevAll().andSelf().removeClass('ratings_over');
                // can't use 'this' because it wont contain the updated data
                set_votes($(this).parent());
            }
        );
          $('.ratings_stars').bind('click', function() {
            var star = this;
            var widget = $(this).parent();
            
            var clicked_data = {
                clicked_on : $(star).attr('class'),
                widget_id : $(star).parent().attr('id')
            };
            var str = clicked_data.clicked_on.toString();
            str=str.replace("star_","");
            str=str.replace("ratings_stars ratings_over","");
           
            //alert(str);
            document.getElementById('suma_rankin').value=str;
        });
        
        
        
    });

    function set_votes(widget) {

        //var avg = $(widget).data('fsr').whole_avg;
        //var votes = $(widget).data('fsr').number_votes;
        //var exact = $(widget).data('fsr').dec_avg;
    
        //window.console && console.log('and now in set_votes, it thinks the fsr is ' + $(widget).data('fsr').number_votes);
        
       // $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
        //$(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote'); 
        //$(widget).find('.total_votes').text( votes + ' votes recorded (' + exact + ' rating)' );
    }
        