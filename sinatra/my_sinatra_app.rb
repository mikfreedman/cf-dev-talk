class MySinatraApp < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    <<-HTML
       <html>
        <body>
          <figure>
            <img src="sinatra.jpg"></img>
            <figcaption>On the run . . . Sinatra arrives at the Melbourne Festival Hall.</figcaption>
          </figure>

          <blockquote>
            Frank Sinatra was in the wrong country at the wrong time. He arrived in Australia for concerts in July 1974, just three years after Germaine Greer had published The Female Eunuch and only 18 months after Melbourne singer Helen Reddy had a worldwide hit with I Am Woman, virtually the theme song for the then rapidly expanding women's liberation movement.
            It was hardly the right moment for Sinatra to get up on stage at Melbourne's Festival Hall and describe Australia's female journalists as "buck-and-a-half hookers".
          </blockquote>

          <p>
          <a href='http://www.smh.com.au/articles/2002/04/21/1019233294418.html'>http://www.smh.com.au/articles/2002/04/21/1019233294418.html</a>
          </p>
        </body>
       </html>
     HTML

  end
end
