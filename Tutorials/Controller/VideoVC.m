//
//  VideoVC.m
//  Tutorials
//
//  Created by macOS on 7/8/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import "VideoVC.h"

@interface VideoVC ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end

@implementation VideoVC

- (IBAction)donePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    
    self.titleLbl.text = _video.videoTitle;
    self.descLbl.text = _video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString* css = @".container { position: relative; width:100%; height: 0; padding-bottom:56.25% } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100% }";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    NSLog(@"js:\n%@",js);
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

@end
