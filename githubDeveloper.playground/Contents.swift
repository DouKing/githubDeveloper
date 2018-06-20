import Cocoa

/*
 curl --header "Authorization: bearer 2a52ee7906411544629d5d3ff660cc9ae9bf332c" -X POST -d " \
 { \
 \"query\": \"query { viewer { login }}\" \
 } \
 " https://api.github.com/graphql
 */

var str = "https://api.github.com/graphql"
let url = URL(string: str)
let query = ["query": "query { viewer { login }}"]
let data = try? JSONSerialization.data(withJSONObject: query, options: JSONSerialization.WritingOptions.prettyPrinted)

let session = URLSession.shared
var request = URLRequest(url: url!)
request.addValue("bearer 2a52ee7906411544629d5d3ff660cc9ae9bf332c", forHTTPHeaderField: "Authorization")
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpMethod = "POST"
request.httpBody = data

session.dataTask(with: request) { (data, response, error) in
    let obj = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
    print(obj ?? "error!!")
  }
  .resume()
