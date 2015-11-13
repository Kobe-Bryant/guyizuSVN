//
//  MapViewController.m
//  
//
//  Created by Jian-Ye on 12-10-16.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import "MapViewController.h"
#import "CallOutAnnotationVifew.h"
#import "JingDianMapCell.h"
#import "ListView.h"
#import "ContentView.h"
#define span 2000

@interface MapViewController ()
{
    NSMutableArray *_annotationList;
    
    CalloutMapAnnotation *_calloutAnnotation;
	CalloutMapAnnotation *_previousdAnnotation;
    
}
-(void)setAnnotionsWithList:(NSArray *)list;

@end

@implementation MapViewController

@synthesize mapView=_mapView;

@synthesize delegate;
static int count=0;
- (void)dealloc
{
    [_mapView release];
    [_annotationList release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _iscontentview=NO;
    }
    return self;
}

- (void)viewDidLoad
{
    _annotationList = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    [JingDianMapCell new];
    count=0;

}

-(void)setAnnotionsWithList:(NSArray *)list
{
    for (NSDictionary *dic in list) {
        //从接口取出的数据有问题；
        
        if([[dic objectForKey:@"longitude"] floatValue]<180.0 && [[dic objectForKey:@"latitude"] floatValue]<90.0)
        {
        CLLocationDegrees latitude=[[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude=[[dic objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
        
        MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location,span ,span );
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation *  annotation=[[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude]  autorelease];
        [_mapView   addAnnotation:annotation];
        }
    }
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        if (_calloutAnnotation) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
        _calloutAnnotation = [[[CalloutMapAnnotation alloc] 
                               initWithLatitude:view.annotation.coordinate.latitude
                               andLongitude:view.annotation.coordinate.longitude] autorelease];
        [mapView addAnnotation:_calloutAnnotation];
        
        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
	}
    else{
        if([delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
            [delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
        }
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if (_calloutAnnotation&& ![view isKindOfClass:[CallOutAnnotationVifew class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {
        CallOutAnnotationVifew *annotationView = (CallOutAnnotationVifew *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
        //if (annotationView==Nil) {
            annotationView = [[[CallOutAnnotationVifew alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"] autorelease];
            JingDianMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianMapCell" owner:self options:nil] objectAtIndex:0];
            if(_iscontentview==NO)
            {
                ListView* listview=[ListView new];
                [listview release];
                listview=_array[count];
                NSLog(@"name=%@",listview.name);
                cell.namelable.text=listview.name;
                cell.pricelable.text=[NSString stringWithFormat:@"人均:¥%@",listview.avgprice];
                switch ([listview.star intValue]) {
                    case 0:
                        cell.starone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 1:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 2:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 3:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 4:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 5:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        break;
                    default:
                        break;
                }
                cell.addresslable.text=listview.address;
                count++;
            }
            else
            {
                ContentView* listview=[ContentView new];
                [listview release];
                listview=_array[0];
                cell.namelable.text=listview.name;
                cell.pricelable.text=[NSString stringWithFormat:@"人均:¥%@",listview.avgprice];
                switch ([listview.star intValue]) {
                    case 0:
                        cell.starone.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 1:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 2:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 3:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 4:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_nix_one.png"];
                        break;
                    case 5:
                        cell.starone.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.startwo.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starthree.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfour.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        cell.starfive.image=[UIImage imageNamed:@"life_score_full_one.png"];
                        break;
                    default:
                        break;
                }
                cell.addresslable.text=listview.address;
            }
            [annotationView.contentView addSubview:cell];
        return annotationView;
	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
        
         MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!annotationView) {
            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation 
                                                           reuseIdentifier:@"CustomAnnotation"] autorelease];
            annotationView.canShowCallout = NO;
            annotationView.image = [UIImage imageNamed:@"map_placemark_red.png"];
        }
		
		return annotationView;
    }
	return nil;
}
- (void)resetAnnitations:(NSArray *)data
{
    [_annotationList removeAllObjects];
    [_annotationList addObjectsFromArray:data];
    [self setAnnotionsWithList:_annotationList];
}
@end
