shinyServer(function(input, output, session) {
  # Kode untuk menampilkan dataset table
  output$dataset <- renderDataTable(
    ispu,
    options = list(scrollX = T,
                   scrollY = T)
  )
  filtered_data <- reactive({
    filter(
      ispu,
      tanggal >= as.Date(input$period_from_2),
      tanggal <= as.Date(input$period_to_2),
      stasiun == input$stasiun_2
    )
  })
  
  #plot line 1
  output$plot1_line  <- renderPlotly({
    plot_data <- filtered_data()
    
    if (nrow(plot_data) == 0) {
      return(NULL)  # No data to plot, return an empty plot
    }
    
    
    # Create the initial ggplot object
    plot <- ggplot(plot_data, aes(x = tanggal)) +
      labs(x = "", y = "", title = glue("Tren ISPU {input$polutan_2} di {input$stasiun_2}"))
    
    for (polutan in input$polutan_2) {
      plot <- plot +
        geom_line(aes(y = !!as.name(polutan), color = polutan), show.legend = FALSE) +
        geom_point(aes(y = !!as.name(polutan), color = polutan, show.legend = FALSE, text = glue("Tanggal         : {tanggal} 
                                                                                                  Tipe Polutan  : {polutan} 
                                                                                                  Kadar             : {plot_data[[polutan]]}")))
    }
    
    plot <- plot +
      theme_minimal()  +
      theme(legend.position = "none")+
      scale_color_manual(values = c("lightblue", "black"))
    
    # Render the ggplot object as a plotly plot
    ggplotly(plot, tooltip = "text")%>%
      htmlwidgets::onRender("
    function(el, x) {
      el.style.height = '650px';
    }
  ")
    
    
  })
  
 
  # Load ARIMA models for each daerah and polutan
  load_model <- function(daerah, polutan) {
    model_folder <- "arima_model"  # Ganti dengan jalur folder yang sesuai
    model_name <- paste("best_arima_model_ispu_", daerah, "_", polutan, ".rds", sep = "")
    return(readRDS(file.path(model_folder, model_name)))
  }
  
  # Create a reactive object to compute predictions
  predictions_data <- eventReactive(input$predictButton,{
    req(input$predictButton)  # Wait for the button click
    
    # Load the selected model based on daerah
    selected_daerah <- input$daerah
    selected_tanggal <- input$tanggal
    
    # List of pollutants to predict
    pollutants <- c("co", "no2", "o3", "pm10", "pm25", "so2")
    
    predictions <- map(pollutants, function(polutan) {
      arima_model <- load_model(selected_daerah, polutan)
      
      # Forecast for the selected tanggal
      forecast_date <- as.Date(selected_tanggal)
      last_train_date <- as.Date("2021-08-07")
      selisih_hari <- as.numeric(difftime(forecast_date, last_train_date, units = "days"))
      
      model_folder <- "arima_model"  # Ganti dengan jalur folder yang sesuai
      model_name <- paste("best_arima_model_ispu_", selected_daerah, "_", polutan, ".rds", sep = "")
      model <- readRDS(file.path(model_folder, model_name))
      print(selected_daerah)
      print(polutan)
      print(model)
      prediksi <- predict(arima_model, h = selisih_hari)
    print(prediksi$pred[1])
      return(round(prediksi$pred[1], 2))
    })
      
    return(predictions)
  })
  
  # Update infoBox elements
  observeEvent(input$predictButton,{
    predictions <- predictions_data()
    
    #model_xgb <- readRDS("model_rf_categori.rds")
    #print(model_xgb)
    # Prediksi dengan model XGBoost
    #new_data <- data.frame(
    #  so2 = predictions[[6]],  # Ganti dengan nilai so2 yang ingin Anda prediksi
    #  co = predictions[[1]],    # Ganti dengan nilai co yang ingin Anda prediksi
    #  o3 = predictions[[3]],   # Ganti dengan nilai o3 yang ingin Anda prediksi
    #  no2 = predictions[[2]],  # Ganti dengan nilai no2 yang ingin Anda prediksi
    #  pm10 = predictions[[4]], # Ganti dengan nilai pm10 yang ingin Anda prediksi
    #  pm25 = predictions[[5]]  # Ganti dengan nilai pm25 yang ingin Anda prediksi
    #)
    #new_data_matrix <- new_data#as.matrix(new_data)
    
    # Melakukan prediksi dengan model XGBoost
    #xgb_pred <- predict(model_xgb, new_data_matrix)
    print("1")
    forecast_date <- as.Date(input$tanggal)
    last_train_date <- as.Date("2021-08-07")
    selisih_hari <- as.numeric(difftime(forecast_date, last_train_date, units = "days"))
    print("2")
    model_rf_category<- readRDS("model_rf_categori.rds")
    data_prediksi <- data.frame( 
                                     so2 = NA,  # Ganti dengan nilai SO2 yang sesuai
                                     co = NA,   # Ganti dengan nilai CO yang sesuai
                                     o3 = NA,   # Ganti dengan nilai O3 yang sesuai
                                     no2 = NA,  # Ganti dengan nilai NO2 yang sesuai
                                     pm10 = NA, # Ganti dengan nilai PM10 yang sesuai
                                     pm25 = NA)
   
    print("3")
    # Melakukan prediksi untuk setiap variabel
    data_prediksi$so2 <- predictions[[6]]
    data_prediksi$co <- predictions[[1]]
    data_prediksi$no2 <- predictions[[2]]
    data_prediksi$o3 <-  predictions[[3]]
    data_prediksi$pm10 <- predictions[[4]]
    data_prediksi$pm25 <- predictions[[5]] 
    kategori_prediksi <- stats::predict(model_rf_category, newdata = data_prediksi) 
    print(data_prediksi)
    print(kategori_prediksi)
    
    label_mapping <- c('BAIK', 'SEDANG', 'TIDAK SEHAT', 'SANGAT TIDAK SEHAT')
    translated_label <- label_mapping[kategori_prediksi]
    
    output$info_box_category <- renderInfoBox({
      infoBox(
        title = "Kategori",
        value = translated_label,
        icon = icon("filter")
      )
    })
    
    # Update each infoBox
    output$info_box_co <- renderInfoBox({
      infoBox(
        title = "Prediksi CO",
        value = predictions[[1]],
        icon = icon("cloud")
      )
    })
    
    output$info_box_no2 <- renderInfoBox({
      infoBox(
        title = "Prediksi NO2",
        value = predictions[[2]],
        icon = icon("cloud")
      )
    })
    
    output$info_box_o3 <- renderInfoBox({
      infoBox(
        title = "Prediksi O3",
        value = predictions[[3]],
        icon = icon("cloud")
      )
    })
    
    output$info_box_pm10 <- renderInfoBox({
      infoBox(
        title = "Prediksi PM10",
        value = predictions[[4]],
        icon = icon("cloud")
      )
    })
    
    output$info_box_pm25 <- renderInfoBox({
      infoBox(
        title = "Prediksi PM2.5",
        value = predictions[[5]],
        icon = icon("cloud")
      )
    })
    
    output$info_box_so2 <- renderInfoBox({
      infoBox(
        title = "Prediksi SO2",
        value = predictions[[6]],
        icon = icon("cloud")
      )
    })
  })
  
  
  
})
