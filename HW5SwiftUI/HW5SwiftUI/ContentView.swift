//
//  ContentView.swift
//  HW5SwiftUI
//
//  Created by Mac on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NewsListDetailView()) { // переход на список новостей
                Text("НОВОСТИ")
            }
        }
    }
}

struct NewsListDetailView: View {
    @State private var news: [NewsItem] = [] // пустой список для дальнейшего залива новостей

    var body: some View {
        List(news) { item in
            VStack(alignment: .leading) { // скелет отображения новости в ячейке
                Text(item.title) // заголовок новости
                    .font(.headline)
                Text(item.pubDate, style: .date) // дата в удобном для чтения формате
                    .font(.subheadline)
            }
        }
        .onAppear {
            self.fetchNews() // вызов метода для запроса новостей от API
        }
        .navigationBarTitle("Список новостей")
    }

    func fetchNews() { // метод с запросом по аналогии с предыдущими заданиями
        if let url = URL(string: "https://kudago.com/public-api/v1.2/news/") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let newsResponse = try? JSONDecoder().decode(NewsResponse.self, from: data) {
                        self.news = newsResponse.results
                    }
                }
            }
            task.resume()
        }
    }

    struct NewsResponse: Decodable {
        let results: [NewsItem]
    }
}

struct NewsItem: Identifiable, Decodable {
    var id: Int
    var publication_date: Int
    var title: String
    var slug: String
    
    // преобразование Integer в Date
    var pubDate: Date {
        return Date(timeIntervalSince1970: TimeInterval(publication_date))
    }
}



