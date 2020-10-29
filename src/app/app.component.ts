import { Component, ViewChild, ElementRef } from "@angular/core";
declare var tableau: any;
@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"]
})

export class AppComponent {
  viz: any;
  @ViewChild("vizContainer") containerDiv: ElementRef;

  ngAfterViewInit() {
    this.initTableau();
  }

  initTableau() {
    const containerDiv = document.getElementById("vizContainer");
    const vizUrl =
      "https://prod-useast-b.online.tableau.com/t/projetolemobs/views/desafiolemobs_16038968081420/Jogosporconsole?:showAppBanner=false&:display_count=n&:showVizHome=n&:origin=viz_share_link";

    const options = {
      hideTabs: false,
      width: "80%",
      height: "600px",
      onFirstInteractive: () => {
        console.log("onFirstInteractive");
      },
      onFirstVizSizeKnown: () => {
        console.log("onFirstVizSizeKnown");
      }
    };

    this.viz = new tableau.Viz(
      containerDiv,
      vizUrl,
      options
    );
  }
}
