dashboardPage(
  #--------- Bagian Header ---------
  dashboardHeader(
    title = "AirWiz"
  ),
  
  #--------- Bagian Sidebar ---------
  dashboardSidebar(
    sidebarMenu(
      menuItem("Cara Menggunakan", tabName = "page0",icon=icon("info-circle")), 
      menuItem("Prediksi ISPU", tabName = "page1",icon=icon("star")), 
      menuItem("Analisis Tren", tabName = "page2",icon=icon("chart-line")),
      menuItem("Dataset", tabName = "page4",icon=icon("server")) ,
      menuItem("Tentang Saya", icon = icon("address-card"),  tabName = "page5")
      
    )
  ), 
  #--------- Bagian Main / Body ---------
  dashboardBody( 
    
    tabItems(
      #--------- Page 0 ---------
      tabItem(
        tabName = "page0",
        
        #---Page 0 Row 1
        fluidPage(
          box( 
            width=12,
            
            titlePanel("Aplikasi Prediksi ISPU - Cara Menggunakan"),
            
            tabsetPanel(
              tabPanel(
                "Halaman Utama",
                h2("Selamat datang di Aplikasi Prediksi Kualitas Udara di Jakarta!"),
                div(tags$head(
                  
                  # Include custom CSS
                  includeCSS("styles.css")
                  
                ),
                tags$img(src = "aqi_images/jakarta.jpeg" ),
                style = "text-align: center; margin-top: 10px;" 
                ),
                h4(div( style = "font-size: 14pt;","Polusi udara merupakan salah satu tantangan lingkungan utama yang dihadapi oleh kota-kota besar di seluruh dunia, termasuk Jakarta, ibu kota Indonesia. Kualitas udara yang buruk dapat berdampak serius terhadap kesehatan masyarakat. Partikel-partikel berbahaya dan zat kimia seperti nitrogen dioksida (NO2), sulfur dioksida (SO2), ozon (O3), dan partikel berukuran mikro dapat masuk ke saluran pernapasan manusia dan menyebabkan berbagai penyakit pernapasan seperti asma, bronkitis, serta meningkatkan risiko penyakit kardiovaskular.")),
                h4(div(style = "font-size: 14pt;","Oleh karena itu, proyek identifikasi polusi udara di Jakarta menjadi suatu kebutuhan masyarakat. Melalui upaya ini, data dan informasi dapat dikumpulkan secara sistematis untuk  : ")),
                tags$ul(
                  tags$li(div(style = "font-size: 14pt;","memprediksi tingkat polusi udara di berbagai lokasi kota, " )),
                  tags$li(div(style = "font-size: 14pt;"," memprediksi sumber-sumber utama polusi, dan")), 
                  tags$li(div(style = "font-size: 14pt;"," memahami pola-pola perubahan dalam kualitas udara seiring waktu.  "))),
                h3("Berikut adalah tabel klasifikasi untuk setiap polutan:"),
                tags$img(src = "aqi_images/pol_value.png"),
                h4("Gambar di atas menunjukkan tabel klasifikasi untuk setiap polutan."),
                h3("Berikut adalah tabel nilai ISPU:"),
                tags$img(src = "aqi_images/ispu_value.png"),
                h4("Gambar di atas menunjukkan tabel klasifikasi untuk Nilai ISPU.")
                
              ),
              tabPanel(
                "Cara Menggunakan Menu Prediksi ISPU", 
                h2("Cara Menggunakan Menu Prediksi ISPU"),
                h3("Berikut adalah langkah-langkah untuk menggunakan Menu Prediksi ISPU:"),
                tags$style(HTML("
                ol {
                  list-style-type: none;
                }
              ")),
              tags$ol(
                tags$li(
                  div(
                    "Langkah 1: Pilih tanggal prediksi", 
                    style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                  ),
                  div(
                    tags$img(src = "aqi_images/id/AQI_1.png" ),
                    style = "text-align: left; margin-top: 10px;" 
                  )
                ),
                tags$li(
                  div(
                    "Langkah 2: Pilih stasiun", 
                    style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                  ),
                  div(
                    tags$img(src = "aqi_images/id/AQI_2.png" ),
                    style = "text-align: left; margin-top: 10px;"  
                  )
                ),
                tags$li(
                  div(
                    "Langkah 3: Klik tombol prediksi", 
                    style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                  ),
                  div(
                    tags$img(src = "aqi_images/id/AQI_3.png" ),
                    style = "text-align: left; margin-top: 10px;"  
                  )
                )
              )
              ),
              tabPanel(
                "Cara Menggunakan Menu Analisis Trend", 
                h2("Cara Menggunakan Menu Analisis Trend"),
                h3("Berikut adalah langkah-langkah untuk menggunakan Menu Analisis Trend:"),
                tags$ol(
                  tags$li(
                    div(
                      "Langkah 1: Pilih 'Dari Tanggal'", 
                      style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                    ),
                    div(
                      tags$img(src = "aqi_images/id/TA_1.png" ),
                      style = "text-align: left; margin-top: 10px;" 
                    )
                  ),
                  tags$li(
                    div(
                      "Langkah 2: Pilih 'Sampai Tanggal'", 
                      style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                    ),
                    div(
                      tags$img(src = "aqi_images/id/TA_2.png" ),
                      style = "text-align: left; margin-top: 10px;"  
                    )
                  ),
                  tags$li(
                    div(
                      "Langkah 3: Pilih 'Stasiun'", 
                      style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                    ),
                    div(
                      tags$img(src = "aqi_images/id/TA_3.png" ),
                      style = "text-align: left; margin-top: 10px;"  
                    )
                  ),
                  tags$li(
                    div(
                      "Langkah 4: Pilih 'Polutan'", 
                      style = "text-align: left; font-size: 20pt; margin-bottom: 10px;"  
                    ),
                    div(
                      tags$img(src = "aqi_images/id/TA_4.png" ),
                      style = "text-align: left; margin-top: 10px;"  
                    )
                  )
                )
              )
            )
          )
        )
        ,
        fluidRow(
          box(
            width=12,
            includeHTML("footer2.Rhtml")  # Menambahkan footer
          )
        )         

      ),
      #--------- Page 1 ---------
      tabItem(
        tabName = "page1",
        
        #---Page 1 Row 1
        fluidRow(
          box(
            width=2,
            height = 700,
            dateInput("tanggal", "Pilih Tanggal", Sys.Date()),
            selectInput("daerah", "Pilih Stasiun",
                        choices = c( "Jakarta Pusat"="dki1" , 
                                     "Jakarta Utara"="dki2" ,
                                     "Jakarta Selatan"="dki3" ,
                                     "Jakarta Timur"="dki4" ,
                                     "Jakarta Barat"="dki5" ),
                        selected = "Jakarta Pusat"),
            actionButton("predictButton", "Prediksi")
          ),
          
          
          
          box(
            width=10,
            height = 700, 
            infoBoxOutput("info_box_co"),
            infoBoxOutput("info_box_no2"),
            infoBoxOutput("info_box_o3"),
            infoBoxOutput("info_box_pm10"),
            infoBoxOutput("info_box_pm25"),
            infoBoxOutput("info_box_so2"),
            infoBoxOutput("info_box_category") 
          ) 
        ) ,
        fluidRow(
          box(
            width=12,
            includeHTML("footer2.Rhtml")  # Menambahkan footer
          )
        )
        
      ),
      
      #--------- Page 2 ---------
      tabItem(
        tabName = "page2",
        
        #---Page 2 Row 1 ---------
        
        fluidRow(
          box(
            width=2,
            height = 700, 
            dateInput("period_from_2", "Dari Tanggal:", value = "2020-01-01", min = "2020-01-01", max = "2021-12-31"),
            dateInput("period_to_2", "Sampai Tanggal:", value = "2021-12-31", min = "2020-01-01", max = "2021-12-31"),
            #selectInput(
            #  inputId = "period_from_2",
            #  label = "Period From:",
            #  choices = unique(ispu$tanggal),
            #  selected = min(ispu$tanggal)
            #),
            #selectInput(
            #  inputId = "period_to_2",
            #  label = "Period To:",
            #  choices = unique(ispu$tanggal),
            #  selected = max(ispu$tanggal)
            #),
            selectInput(
              inputId = "stasiun_2",
              label = "Pilih Stasiun:",
              choices = unique(ispu$stasiun),
              selected = unique(ispu$stasiun)[1]
            ),
            selectInput(
              inputId = "polutan_2",
              label = "Pilih Polutan:",
              choices = c("pm10", "so2", "co", "o3", "no2", "pm25"),
              selected = "pm10" 
            )
          ), 
          box(
            width=10,
            height = 700, 
            plotlyOutput("plot1_line"),
            style = "height: 700px;"
          ),
        )  ,
        fluidRow(
          box(
            width=12,
            includeHTML("footer2.Rhtml")  # Menambahkan footer
          )
        )
      ),
      #--------- Page 4 ---------
      tabItem(
        tabName = "page4", 
        fluidRow(
          box(
            width=12, 
            height = 700, 
            dataTableOutput(outputId= "dataset")
          )
        ),
        fluidRow(
          box(
            width=12,
            includeHTML("footer2.Rhtml")  # Menambahkan footer
          )
        )
      ),
      #--------- About Me ---------
      tabItem(
        tabName = "page5",
        box(
          width=12, 
          height = 700, 
          fluidRow( 
            div(
              style = "display: flex; flex-direction: column; justify-content: center; align-items: center; ", 
              # Membungkus konten di dalam div dengan pengaturan flexbox
              #h2("Tentang Saya", style = "font-size: 24pt;font-weight: bold;"),  # Mengatur ukuran huruf, warna, dan pemusatan teks
              div(
                style = "text-align: center;",  # Pusatkan konten
                img(src = "aqi_images/pas photo.png", width = 200, style = "border-radius: 50%;"),  # Tambahkan efek border-radius
                h3("Heinz Siahaan", style = "font-size: 22pt;"),  # Mengatur ukuran huruf nama 
                h4("Email: ", a("heinzmdsiahaan@gmail.com", href = "mailto:heinzmdsiahaan@gmail.com")),
                h4("WhatsApp: 0813 84 767 434"),
                h4("LinkedIn: ", a("heinz-siahaan-452b0148", href = "https://www.linkedin.com/in/heinz-siahaan-452b0148/")),
              )
            ) 
          ),
          
          fluidRow(
            
            #Recent project text
            column(
              width = 12,
              div(
                style="text-align:justify;
                          font-size: 15px;
                          color:black;
                          border-color:black;
                          border-radius:10px;
                          border-size:15px
                         ",
                HTML(
                  paste("<b><center><h4><u>My Recent Project</center></u></b></h4><br>")
                )
              )
            ),
            
            #First project description text
            box(
              style = "color: black; background-color: #F0F8FF; border-color: #F0F8FF",
              collapsible = F,
              width = 4, 
              div(
                HTML(paste("<b><center><u>Telebot</b></center></u><br>
                              <h5 style='text-align: justify;line-height: 1.5;'>Proyek inovatif ini bertujuan untuk memberikan solusi yang kuat dan ramah pengguna untuk menyediakan laporan iklan harian di Facebook untuk berbagai kampanye pemasaran. Bot ini memanfaatkan platform pesan Telegram untuk menawarkan berbagai fitur dan fungsionalitas.</h5>
                              <br><a href= https://github.com/HeinzSiahaan/telebot><b><i><h5>Klik di sini!</b></i></a></h5>")))
            ),
            
            #RPubs description text
            box(
              style = "color: black; background-color: #F0F8FF; border-color: #F0F8FF;",
              collapsible = F,
              width = 4, 
              div(
                HTML(paste("<b><center><u>RPubs Documentation</b></center></u><br>
                              <h5 style='text-align: justify; line-height: 1.5;'>Untuk meningkatkan keterampilan saya di bidang ilmu data, saya menulis beberapa penelitian dan analisis sederhana yang dikombinasikan dengan pembelajaran mesin dalam beberapa bidang, seperti keuangan, video game, konten media sosial, dll. Saya juga akan terus memperbarui proyek-proyek saya di sini.</h5>
                              <br><a href= https://rpubs.com/heinzmdsiahaan><b><i><h5>Klik di sini!</b></i></a></h5>")))
            ),
            
            #Second project description text
            box(
              style = "color: black; background-color: #F0F8FF; border-color: #F0F8FF",
              collapsible = F,
              width = 4, 
              div(
                HTML(paste("<b><center><u>Web Scraping</b></center></u><br>
                              <h5 style='text-align: justify; line-height: 1.5;'> Proyek ini dikembangkan untuk melakukan simple webscrapping untuk mendapatkan informasi dan memanfaatkan flask dashboard sederhana untuk menampilkan hasil scrap dan visualisasi kita.</h5>
                              <br><a href= https://github.com/HeinzSiahaan/WebScrapingExchangeRate><b><i><h5>Klik di sini!</b></i></a></h5>")))
            )
          ),
          
        ),
        fluidRow(
          box(
            width=12,
            includeHTML("footer2.Rhtml")  # Menambahkan footer
          )
        )
      )
      
    )
  )
)