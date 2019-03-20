//
//  UIImage.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

/// ZK: UIImage
public extension UIImage {
    /// ZK: 压缩图片质量
    ///
    /// - Parameters:
    ///   - size: 压缩到此大小
    /// - Returns: Data
    public func compression(_ size: Int) -> Data {
        //先判断当前质量是否满足要求，不满足再进行压缩
        var finallImageData = self.jpegData(compressionQuality: 1.0)
        let sizeOrigin      = finallImageData?.count
        let sizeOriginKB    = sizeOrigin! / 1024
        if sizeOriginKB <= size {
            return finallImageData!
        }
        //先调整分辨率
        var defaultSize = CGSize(width: 1024, height: 1024)
        let newImage = self.newSizeImage(size: defaultSize, sourceImage: self)

        finallImageData = newImage.jpegData(compressionQuality: 1.0)

        //保存压缩系数
        let compressionQualityArr = NSMutableArray()
        let avg = CGFloat(1.0 / 250)
        var value = avg

        var i = 250
        repeat {
            i -= 1
            value = CGFloat(i)*avg
            compressionQualityArr.add(value)
        } while i >= 1

        /*
         调整大小
         说明：压缩系数数组compressionQualityArr是从大到小存储。
         */
        //思路：使用二分法搜索
        finallImageData = self.halfFuntion(arr: compressionQualityArr.copy() as! [CGFloat], image: newImage, sourceData: finallImageData!, size: size)
        //如果还是未能压缩到指定大小，则进行降分辨率
        while finallImageData?.count == 0 {
            //每次降100分辨率
            if defaultSize.width-100 <= 0 || defaultSize.height-100 <= 0 {
                break
            }
            defaultSize = CGSize(width: defaultSize.width-100, height: defaultSize.height-100)
            let image = self.newSizeImage(size: defaultSize, sourceImage: UIImage.init(data: newImage.jpegData(compressionQuality: compressionQualityArr.lastObject as! CGFloat)!)!)
            finallImageData = self.halfFuntion(arr: compressionQualityArr.copy() as! [CGFloat], image: image, sourceData: image.jpegData(compressionQuality: 1.0)!, size: size)
        }

        return finallImageData!
    }
    /// ZK: 调整图片分辨率/尺寸（等比例缩放）
    private func newSizeImage(size: CGSize, sourceImage: UIImage) -> UIImage {
        var newSize = CGSize(width: sourceImage.size.width, height: sourceImage.size.height)
        let tempHeight = newSize.height / size.height
        let tempWidth = newSize.width / size.width

        if tempWidth > 1.0 && tempWidth > tempHeight {
            newSize = CGSize(width: sourceImage.size.width / tempWidth, height: sourceImage.size.height / tempWidth)
        } else if tempHeight > 1.0 && tempWidth < tempHeight {
            newSize = CGSize(width: sourceImage.size.width / tempHeight, height: sourceImage.size.height / tempHeight)
        }

        UIGraphicsBeginImageContext(newSize)
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    /// ZK: 二分法
    private func halfFuntion(arr: [CGFloat], image: UIImage, sourceData finallImageData: Data, size: Int) -> Data? {
        var tempFinallImageData = finallImageData

        var tempData = Data.init()
        var start = 0
        var end = arr.count - 1
        var index = 0

        var difference = Int.max
        while start <= end {
            index = start + (end - start)/2

            tempFinallImageData = image.jpegData(compressionQuality: arr[index])!

            let sizeOrigin = tempFinallImageData.count
            let sizeOriginKB = sizeOrigin / 1024

            print("ZKCommon -> \(Date.zk.nowString) -> : 当前降到的质量：\(sizeOriginKB)\n\(index)----\(arr[index])")

            if sizeOriginKB > size {
                start = index + 1
            } else if sizeOriginKB < size {
                if size-sizeOriginKB < difference {
                    difference = size-sizeOriginKB
                    tempData = tempFinallImageData
                }
                end = index - 1
            } else {
                break
            }
        }
        return tempData
    }
}
