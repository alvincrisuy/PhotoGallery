//
//  PX500Convenience.swift
//  PhotoGallery
//
//  Created by Cris Uy on 25/05/2017.
//  Copyright © 2017 Alvin Cris Uy. All rights reserved.
//

import Foundation

func parsePopularPage(withURL: URL) -> Resource<PopularPageModel> {
    
    let parse = Resource<PopularPageModel>(url: withURL, parseJSON: { jsonData in
        
        guard let json = jsonData as? JSONDictionary, let photos = json["photos"] as? [JSONDictionary] else { return .failure(.errorParsingJSON)  }
        
        guard let model = PopularPageModel(dictionary: json, photosArray: photos.flatMap(PhotoModel.init)) else { return .failure(.errorParsingJSON) }
        
        return .success(model)
    })
    
    return parse
}
