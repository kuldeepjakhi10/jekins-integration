import java.applet.Applet;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.font.TextAttribute;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.awt.print.Paper;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import netscape.javascript.JSObject;


import javax.print.PrintService;
import javax.print.attribute.PrintRequestAttributeSet;

import com.sun.java_cup.internal.parse_action;

public class TicketApplet extends Applet implements Printable {

	private Graphics g;

	Rectangle2D rect = null;

	private FontMetrics fm;

	private int height = 0;
	private int prevyAxis = 10;
	int appletWidth = 0;
	public double abc=0.0;
	private Map<String,String> dataMap;
	String isReprint = "false";
	

	public static enum GameNameEnum {
		Lotto, Zimlotto, Fastlotto, Fortune, Card12, Card16, Keno, Zerotonine, TwelveByTwentyFour
	}

	public enum Alignment {
		CENTERED, LEFTMARGIN, RIGHTMARGIN, LEFTALONGRIGHT
	}

	private GameNameEnum gameNameEnum;
	private Alignment alignment;

	public void setXY() {
		height = 0;
		prevyAxis = 10;
	}

	public static String[] fortuneData = { "Aries", "Taurus", "Gemini",
			"Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius",
			"Capricorn", "Aquarius", "Pisces" };

	public static String[] card12Data = { "Ace_Spade", "Ace_Club", "Ace_Heart",
		"Ace_Diamond", "King_Spade", "King_Club", "King_Heart",
		"King_Diamond", "Queen_Spade", "Queen_Club", "Queen_Heart",
		"Queen_Diamond" };

	public static String[] card16Data = { "Ace_Spade", "Ace_Club", "Ace_Heart",
		"Ace_Diamond", "King_Spade", "King_Club", "King_Heart",
		"King_Diamond", "Queen_Spade", "Queen_Club", "Queen_Heart",
		"Queen_Diamond", "Jack_Spade", "Jack_Club", "Jack_Heart",
		"Jack_Diamond"  };

	public static String[] zeroToNineData = { "Zero(0)", "One(1)", "Two(2)",
			"Three(3)", "Four(4)", "Five(5)", "Six(6)", "Seven(7)", "Eight(8)",
			"Nine(9)" };

	public TicketApplet() {
		img = null;
	}

	public void destroy() {
		
	}

	 public void showStatus(String data) {
		 passData(data);
	}	
	 
	private void passData(String data){
		System.out.println("Before Map**"+data);
		dataMap = new HashMap<String,String>();
		String[] dataArr=data.split("\\|");
		String[] param = null;
		for(int i=0;i<dataArr.length;i++){
			System.out.println(i);
			System.out.println(dataArr[i]);
			param= dataArr[i].split("=");
			dataMap.put(param[0],param[1]);
		}
		System.out.println("After Map**"+dataMap);
		init();
	}
	
	public void init() {
		if (dataMap!=null) {
			if(!"Cancel".equalsIgnoreCase(dataMap.get("mode"))){
				Linear linear = new Linear();
				app = getAppletContext().getApplet("TicketApp");
				
				linear.barcode = dataMap.get("data");
				
				BufferedImage bufferedimage = new BufferedImage(100, 100, 13);
				Graphics2D graphics2d = bufferedimage.createGraphics();
				linear.paint(graphics2d);
				linear.invalidate();
				graphics2d.dispose();
				BufferedImage bufferedimage1 = new BufferedImage(
						linear.getSize().width, linear.getSize().height, 13);
				Graphics2D graphics2d1 = bufferedimage1.createGraphics();
				linear.paint(graphics2d1);
				img = bufferedimage1;
			}
			
			try {
				PrinterJob printJob = PrinterJob.getPrinterJob();
				PageFormat pageFormat = printJob.defaultPage();
				Paper paper = pageFormat.getPaper();
				paper.setImageableArea(0.0, 0.0, Double.MAX_VALUE,
						Double.MAX_VALUE);
				pageFormat.setPaper(paper);
				printJob.setPrintable(this, pageFormat);
				PrintService printer = printJob.getPrintService();

				if (printer != null) { // See if there is a printer

					try {
						 System.out.println(printJob); 
						 printJob.print(); // ...then print
						 System.out.println("b4 printer exception........."); 
						 notifyRPOS("SUCCESS");
					} catch (PrinterException pe) {
						System.out.println("*********1111********************In Catch if printer not null");
						if (notifyRPOS("FAIL")== true)
						{
							//flag = true;
						}
						else
						{
							//flag = false;
						}
					}
				} else {
					
					 System.out.println("**************2222*********************In Catch if printer null");
					 if (notifyRPOS("FAIL")== true)
						{
							//flag = true;
						}
						else
						{
							//flag = false;
						}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public boolean notifyRPOS(String printStatus) {
		System.out.println("*********1********************");
		double totAmt = 0.0;
		String drawAmt = dataMap.get("drawAmtStr");
		if (drawAmt != null) {
			String[] amt = drawAmt.split(",");
			System.out.println("*********2********************");
			for (int i = 0; i < amt.length; i++) {
				try {
					totAmt = totAmt
							+ Double.parseDouble(amt[i].replace("NA", "0.0"));
				} catch (NumberFormatException nfe) {
					nfe.printStackTrace();
				}
			}
		}
		System.out.println("*********3********************");
		Object[] obj = new Object[3];
		obj[0] = dataMap.get("data");
		obj[1] = totAmt;
		obj[2] = printStatus;
		System.out.println("*********4********************");
		JSObject jsOb = (JSObject) JSObject.getWindow(this);
		boolean abd = (Boolean)jsOb.call("cancelTktAuto2", obj);
	
		System.out.println("*********5*******"+ abd +"*************");
		return abd;
	}
	
	public void start() {
		System.out.println("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
	}

	public void stop() {
	}

	private void setGraphics(Graphics g) {
		this.g = g;
	}

	public void paint(Graphics g) {
		if(dataMap!=null){
			setXY();
			setGraphics(g);
	
			String mode = dataMap.get("mode");
	
			if (mode.equals("Buy")) {
				prepareTicket();
			} else if (mode.equals("PWT")) {
				preparePWT();
			} else if(mode.equalsIgnoreCase("Cancel")){
				prepareCancel();
			}
		}
	}

	private void prepareTicket() {
		java.awt.Image newImage = Toolkit.getDefaultToolkit().createImage(
				img.getSource());
		Map<TextAttribute, Object> textAttributes = new HashMap<TextAttribute, Object>();
		String gameNum;
		String betAmountMultiple = dataMap.get("betAmountMultiple");
		String ticketNumber = dataMap.get("ticketNumber");
		String isQP = dataMap.get("isQP");
		String expiryPeriod = dataMap.get("expiryPeriod");
		String noOfDraws = dataMap.get("noOfDraws");
		String pickedNumbers = dataMap.get("pickedNumbers");
		String isQuickPick = dataMap.get("isQuickPickArray");
		String drawDateTime = dataMap.get("drawDateTime");
		String totalPurchaseAmt = dataMap.get("totalPurchaseAmt");
		String saleStatus = dataMap.get("saleStatus");
		String purchaseTime = dataMap.get("purchaseTime").replace(".0", "");
		
		String reprintCount = dataMap.get("reprintCount");
		String currSymbol = dataMap.get("currSymbol");
		String orgName = dataMap.get("orgName");
		String advtMsg = dataMap.get("advtMsg");
		String jackPotAmt = dataMap.get("jackPotAmt");
		String orgAddress = dataMap.get("orgAddress");
		String orgMobile = dataMap.get("orgMobile");
		String retailerName = dataMap.get("retailerName");
		String verifiedAt = dataMap.get("retailerName");
		if (isReprint.equalsIgnoreCase("true")&&dataMap.get("retailerNameReprint")!=null) {
			retailerName = dataMap.get("retailerNameReprint");
		}
		String sampleStatus = dataMap.get("sampleStatus");
		String gameName = dataMap.get("gameName");
		String gameDispName = dataMap.get("gameDispName");
		String playType = dataMap.get("playType");
		String totalQuantity = dataMap.get("totalQuantity");
		// System.out.println("DATE CTR:" + this.getParameter("ctr"));
		String[] purchaseTimeArr = purchaseTime.split(" ");
		String[] drawDateTimeArr = drawDateTime.split(",");
		String[] betAmountMultArr = (betAmountMultiple != null) ? betAmountMultiple
				.split(",")
				: null;
		String[] kenoNums = pickedNumbers.split(",");
		String[] pickedNumbersArr = null;
		if (gameName.equals("Fortune") || gameName.equals("Zerotonine")
				|| gameName.equals("Card16") || gameName.equals("Card12")) {
			pickedNumbersArr = pickedNumbers.split(",");
		} else if (gameName.equals("Lotto") || gameName.equals("Zimlotto")
				|| gameName.equals("Fastlotto")) {
			pickedNumbersArr = pickedNumbers.split(";");
		}

		String data = dataMap.get("data");
		int betAmtVal = 0;
		int pickedNumVal = 0;

		double unitPrice;
		unitPrice = (Double.parseDouble(totalPurchaseAmt) / (Double
				.parseDouble(noOfDraws) * Double.parseDouble(totalQuantity)));
		String str;
		appletWidth = getWidth();

		// System.out.println("appletWidth: " + appletWidth);
		// System.out.println("appletHeight: " + getHeight());
		String[] symbolArr = getWinningArray(GameNameEnum.valueOf(gameName));

		// setting beginning astericks
		Font font = new Font("Arial", Font.PLAIN, 10);
		
		
		/*if(orgMobile != null){
			drawFormattedString("Org Mobile is: " + orgMobile, font, 0, 0,
					alignment.RIGHTMARGIN);
		}*/
		
		/*if(orgAddress != null){
			drawFormattedString("Org Address is: " + orgAddress, font, 0, 0,
					alignment.RIGHTMARGIN);
		}*/
		
		

		drawFormattedString("*********************************************", font, 0, 0,
				alignment.CENTERED);

		// setting organization name
		
		textAttributes.put(TextAttribute.WEIGHT, 300f);
		textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
		textAttributes.put(TextAttribute.SIZE, 24f);
		textAttributes.put(TextAttribute.WIDTH,
				TextAttribute.WIDTH_SEMI_CONDENSED);
		textAttributes.put(TextAttribute.JUSTIFICATION, 0.5f);
		font = this.getFont().deriveFont(textAttributes);
		
		drawFormattedString(orgName, font, 0, 5, alignment.CENTERED);
		textAttributes.clear();
		
		textAttributes.put(TextAttribute.WEIGHT, 300f);
		textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
		textAttributes.put(TextAttribute.SIZE, 15f);
		font = this.getFont().deriveFont(textAttributes);
		
		drawFormattedString(gameDispName, font, 0, -15, alignment.CENTERED);
		textAttributes.clear();
		
		textAttributes.clear();
		height = height - 20;
		font = new Font("Arial", Font.PLAIN, 10);
		drawFormattedString(" ", font, 0, 0, alignment.CENTERED);
		int reCount = 0;
		try {
			reCount = Integer.parseInt(reprintCount);
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
		}
		int sideWaysMargin = 15;
		
		
		
		if (reCount > 0 || isReprint.equalsIgnoreCase("true")) {
			drawFormattedString("Re-Print At "+verifiedAt, font, 0, 3,
					alignment.CENTERED);
			isReprint = "false";
		}
		
		g.setFont(font);

		// setting purchase date and time
		
		
		//drawFormattedString(retailerName, font, sideWaysMargin, 0,
			//	alignment.CENTERED);
		
		String[] strArr2 = purchaseTimeArr[0].split("-");
		
		StringBuilder sb2 = new StringBuilder("");
		for(int i=strArr2.length-1; i>=0; i--){
			sb2.append(strArr2[i]);
			if(i!=0)
				sb2.append("-");
				
		}
			
		System.out.println(sb2.toString());
		
		drawFormattedString(sb2.toString(), font, sideWaysMargin, 0,
				alignment.LEFTALONGRIGHT);
		drawFormattedString(purchaseTimeArr[1], font, sideWaysMargin, 0,
				alignment.RIGHTMARGIN);

		// printing ticket number
		int constX = 15;
		// drawFormattedString("TicNo : " + data, font, constX, 10,
		// alignment.LEFTMARGIN);

		str = "----------------------------------------------------";
		drawFormattedString(str, font, 0, -5, alignment.CENTERED);

		// draw date and draw time headers
		str = "Draw Date";
		drawFormattedString(str, font, sideWaysMargin, -5,
				alignment.LEFTALONGRIGHT);

		str = "Draw Time";
		drawFormattedString(str, font, sideWaysMargin, -5,
				alignment.RIGHTMARGIN);

		for (int ctr = 0; ctr < drawDateTimeArr.length; ctr++) {
			String[] dateArr = drawDateTimeArr[ctr].split(" ");
			
			String[] strArr = dateArr[0].split("-");
			
			StringBuilder sb = new StringBuilder("");
			for(int i=strArr.length-1; i>=0; i--){
				sb.append(strArr[i]);
				if(i!=0)
					sb.append("-");
					
			}
				
			System.out.println(sb.toString());
			
			
			drawFormattedString(sb.toString(), font, sideWaysMargin, 0,
					alignment.LEFTALONGRIGHT);
			
			if (gameName.equals("Keno")){
				String[] drawNameArr = dateArr[1].split("\\*");
				drawFormattedString(drawNameArr[0], font, sideWaysMargin, 0,
						alignment.RIGHTMARGIN);
				if(drawNameArr.length>1){
					drawFormattedString(drawNameArr[1], font, sideWaysMargin, 0,
							alignment.CENTERED);
				}
			}else{
				drawFormattedString(dateArr[1], font, sideWaysMargin, 0,
						alignment.RIGHTMARGIN);
			}
		}

		str = "----------------------------------------------------";
		drawFormattedString(str, font, 0, -5, alignment.CENTERED);
		

		if (gameName.equals("Lotto") || gameName.equals("Zimlotto")
				|| gameName.equals("Fastlotto")) {
			String[] qp = isQuickPick.split(",");
			for (int ctr = 0; ctr < pickedNumbersArr.length; ctr++){
				drawFormattedString(pickedNumbersArr[ctr], font, 15, 0, alignment.CENTERED);
				if(1 == Integer.parseInt(qp[ctr])){
					drawFormattedString("QP", font, 15, -11, alignment.RIGHTMARGIN);
				}
			}
		} else if (gameName.equals("Fortune") || gameName.equals("Zerotonine")
				|| gameName.equals("Card16") || gameName.equals("Card12")) {
			String winningResult = null;
			if(Integer.parseInt(isQP) == 1){
				drawFormattedString("QP", font, sideWaysMargin, 0, alignment.RIGHTMARGIN);
			}
			for (int ctr = 0; ctr < pickedNumbersArr.length; ctr++) {
				pickedNumVal = Integer.parseInt(pickedNumbersArr[ctr].replace(
						"[", "").replace("]", "").replace(" ", ""));
				betAmtVal = Integer.parseInt(betAmountMultArr[ctr].replace("[",
						"").replace("]", "").replace(" ", ""));
				winningResult = symbolArr[pickedNumVal - 1];
				drawFormattedString(winningResult, font, sideWaysMargin, 0,
						alignment.LEFTALONGRIGHT);
				drawFormattedString(betAmtVal + "", font, sideWaysMargin, 0,
						alignment.RIGHTMARGIN);

			}
		} else {
			/*
			 * textAttributes.clear(); textAttributes.put(TextAttribute.WEIGHT,
			 * 1600f); textAttributes.put(TextAttribute.FAMILY, "Arial");
			 * textAttributes.put(TextAttribute.SIZE, 10f); font =
			 * this.getFont().deriveFont(textAttributes);
			 */
			font = new Font("Arial", Font.BOLD, 10);
			drawFormattedString(playType, font, sideWaysMargin, -5,
					alignment.LEFTMARGIN);
			if(Integer.parseInt(isQP) == 1){
				drawFormattedString("QP", font, sideWaysMargin, -11, alignment.RIGHTMARGIN);
			}
			// textAttributes.clear();
			font = new Font("Arial", Font.PLAIN, 10);

			String tempData;

			if (playType.equalsIgnoreCase("banker")) {
				drawFormattedString("Upper Line", font, 0, 0,
						alignment.CENTERED);
				drawFormattedString(pickedNumbers.substring(0,
						pickedNumbers.indexOf(",UL")).replaceAll(",", "-"),
						font, 0, 0, alignment.CENTERED);
				drawFormattedString("Below Line", font, 0, 0,
						alignment.CENTERED);
				// drawFormattedString(pickedNumbers.substring(pickedNumbers.indexOf(",UL,")+4,pickedNumbers.indexOf(",BL")),
				// font, 0, 0, alignment.CENTERED);
				tempData = pickedNumbers.substring(pickedNumbers
						.indexOf(",UL,") + 4, pickedNumbers.indexOf(",BL"));
			} else {
				tempData = pickedNumbers;
			}
			tempData = tempData.replaceAll(",", "-");
			if (tempData.length() > 30) {
				int i = 0;
				int pickNumLen = tempData.length();
				for (int x = 0; x <= pickNumLen / 30; x++) {
					drawFormattedString(tempData.substring(i,
							i + 30 > pickNumLen ? pickNumLen : i + 30), font,
							0, 0, alignment.CENTERED);
					i = i + 30;
				}

			} else {
				drawFormattedString(tempData, font, 0, 0, alignment.CENTERED);
			}

			// drawFormattedString(playType, font, 0, 0, alignment.CENTERED);
		}

		str = "----------------------------------------------------";
		// Total Quantity
		drawFormattedString(str, font, 0, -5, alignment.CENTERED);
		drawFormattedString(gameName.equals("Keno") ? "Total No. of Line(s)"
				: "Total Quantity", font, sideWaysMargin, 0,
				alignment.LEFTALONGRIGHT);
		drawFormattedString(totalQuantity + "", font, sideWaysMargin, 0,
				alignment.RIGHTMARGIN);
		// Unit Price
		drawFormattedString("Unit Price(" + currSymbol + ")", font,
				sideWaysMargin, 0, alignment.LEFTALONGRIGHT);
		drawFormattedString(unitPrice + "", font, sideWaysMargin, 0,
				alignment.RIGHTMARGIN);

		// Number of Draws
		drawFormattedString("No. Of Draws", font, sideWaysMargin, 0,
				alignment.LEFTALONGRIGHT);
		drawFormattedString(noOfDraws, font, sideWaysMargin, 0,
				alignment.RIGHTMARGIN);
		// Total Amount
		drawFormattedString("Total Amount(" + currSymbol + ")", font,
				sideWaysMargin, 0, alignment.LEFTALONGRIGHT);
		drawFormattedString(totalPurchaseAmt, font, sideWaysMargin, 0,
				alignment.RIGHTMARGIN);
		height = height - 10;
		// drawFormattedString("SAMPLE NOT FOR SALE", font, 40, 0,
		// alignment.CENTERED);
		// Bar Image
		g.drawImage(newImage, (appletWidth - newImage
				.getWidth(new ImageObserver() {
					public boolean imageUpdate(Image img, int infoflags, int x,
							int y, int width, int height) {
						return true;
					}
				})) / 2, prevyAxis + height, null);

		/* System.out.println(height + " **" + prevyAxis + " **"); */
		height = height + 55;
		/* System.out.println(height + " **" + prevyAxis + " **"); */
		
		drawFormattedString(retailerName.toUpperCase(), font, 0, 0,
				alignment.CENTERED);
		
		//drawFormattedString("Ticket Validity: " +expiryPeriod + " days", font, 0, 0, alignment.CENTERED);
		
		
		if(sampleStatus.equalsIgnoreCase("YES")){
			drawFormattedString("SAMPLE NOT FOR SALE", font, 0, 0,
					alignment.CENTERED);
		}
		
		/*if(advtMsg != null){
			drawFormattedString(advtMsg, font, 0, 0,
					alignment.CENTERED);
		}*/
		
		if(jackPotAmt != null){
			double jackPot = Double.parseDouble(jackPotAmt);
			if(jackPot <= 140000){
				drawFormattedString("MIN JACKPOT 1 MILLION RAND", font, 0, 0,
						alignment.CENTERED);
			}else{
				drawFormattedString("ESTD JACKPOT 1.5 MILLION RAND", font, 0, 0,
						alignment.CENTERED);
			}
		}
		
		
		drawFormattedString("********************************************", font, 0, 0,
				alignment.CENTERED);
	}

	private void preparePWT() {
		appletWidth = this.getWidth();
		try {
			String isValid = dataMap.get("isValid");
			String status = dataMap.get("status");
			String orgName = dataMap.get("orgName");
			String currSymbol = dataMap.get("currSymbol");
			String retailerName = dataMap.get("retailerName");
			String gameDispName = dataMap.get("gameDispName");
			String ticketNumber = dataMap.get("ticketNumber");
			String reprintCount = dataMap.get("reprintCount");
			String drawDateTime = dataMap.get("drawDateTime");
			String data = ticketNumber + reprintCount;
			String noOfPanels = dataMap.get("noOfPanels");
			String panelsString = dataMap.get("panelsString");
			String totalPay = dataMap.get("totalPay");
			isReprint = dataMap.get("isReprint");

			String nonWinStr[] = dataMap.get("nonWinStr").split(",");
			String winStr[] = dataMap.get("winStr").split(",");
			String registerStr[] = dataMap.get("registerStr").split(",");
			int totRegister = 0;
			String claimStr[] = dataMap.get("claimStr").split(",");
			String outVerifyStr[] = dataMap.get("outVerifyStr").split(",");
			String pndPayStr[] = dataMap.get("pndPayStr").split(",");
			String resultAwaitedStr[] = dataMap.get("resultAwaitedStr").split(
					",");
			String drawAmtStr[] = dataMap.get("drawAmtStr").split(",");

			/*
			 * System.out.println("this.getParameter(drawAmtStr)" +
			 * this.getParameter("drawAmtStr"));
			 */
			double totTktAmt = 0.0;
			String[] drawDateTimeArr = drawDateTime.split(",");
			/*
			 * for (int i = 0; i < drawDateTimeArr.length; i++)
			 * System.out.println("drawDateTimeArr" + drawDateTimeArr[i]);
			 * System.out.println("drawDateTimeArr" +
			 * this.getParameter("resultAwaitedStr"));
			 * 
			 * System.out.println("nonWinStr" + this.getParameter("nonWinStr"));
			 * 
			 * for (int i = 0; i < resultAwaitedStr.length; i++)
			 * System.out.println("resultAwaitedStr" + resultAwaitedStr[i]);
			 */

			Font font = new Font("Arial", Font.PLAIN, 10);
			if (isValid.equals("false")) {
				drawFormattedString("Invalid Ticket", font, 0, 0,
						alignment.CENTERED);
				return;
			}

			Map<TextAttribute, Object> textAttributes = new HashMap<TextAttribute, Object>();

			// setting beginning astericks

			drawFormattedString("****************************************", font, 0,
					0, alignment.CENTERED);

			// setting organization name
			textAttributes.put(TextAttribute.WEIGHT, 300f);
			textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
			textAttributes.put(TextAttribute.SIZE, 24f);
			textAttributes.put(TextAttribute.WIDTH,
					TextAttribute.WIDTH_SEMI_CONDENSED);
			textAttributes.put(TextAttribute.JUSTIFICATION, 0.5f);
			font = this.getFont().deriveFont(textAttributes);
			
			drawFormattedString(orgName, font, 0, 5, alignment.CENTERED);
			textAttributes.clear();
			
			textAttributes.put(TextAttribute.WEIGHT, 300f);
			textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
			textAttributes.put(TextAttribute.SIZE, 15f);
			font = this.getFont().deriveFont(textAttributes);
			/*if(gameDispName.equalsIgnoreCase("zimlotto")){
				gameDispName = " A REAL LOTTO";
			}*/
			drawFormattedString(gameDispName, font, 0, -14, alignment.CENTERED);
			textAttributes.clear();

			textAttributes.clear();
			textAttributes.put(TextAttribute.WEIGHT, 400f);
			textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
			textAttributes.put(TextAttribute.SIZE, 15f);
			font = this.getFont().deriveFont(textAttributes);
			height = height - 20;
			drawFormattedString("PWT Verification", font, 0, 20,
					alignment.CENTERED);
			textAttributes.clear();

			// set font to Arial for further tags
			font = new Font("Arial", Font.PLAIN, 10);
			// printing ticket number
			int constX = 15;
			drawFormattedString("TicNo : " + data, font, constX, -5,
					alignment.LEFTMARGIN);
			String str = "";
			int sideWaysMargin = 15;
			if (status.equals("SUCCESS")) {

				for (int ctr = 0; ctr < drawDateTimeArr.length; ctr++) {

					String[] dateArr = drawDateTimeArr[ctr].split(" ");
					
					
					
					
					drawFormattedString(dateArr[0], font, sideWaysMargin, 0,
							alignment.LEFTALONGRIGHT);
					drawFormattedString(dateArr[1], font, sideWaysMargin, 0,
							alignment.RIGHTMARGIN);
					if (resultAwaitedStr[ctr].equals("true")) {
						drawFormattedString("Result", font, sideWaysMargin, 0,
								alignment.LEFTALONGRIGHT);
						drawFormattedString("Awaited", font, sideWaysMargin, 0,
								alignment.RIGHTMARGIN);
					} else {
						// System.out.println(nonWinStr[ctr]);
						if (!(nonWinStr[ctr].equals("NA") || nonWinStr[ctr]
								.equals("0"))) {
							drawFormattedString(nonWinStr[ctr] + "Panel (s)",
									font, sideWaysMargin, 0,
									alignment.LEFTALONGRIGHT);
							drawFormattedString("TRY AGAIN", font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						if (!(winStr[ctr].equals("NA") || winStr[ctr]
								.equals("0"))) {
							drawFormattedString(winStr[ctr] + "Panel (s)",
									font, sideWaysMargin, 0,
									alignment.LEFTALONGRIGHT);
							drawFormattedString("WIN" + drawAmtStr[ctr], font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						if (!(registerStr[ctr].equals("NA") || registerStr[ctr]
								.equals("0"))) {
							drawFormattedString(registerStr[ctr] + "Panel (s)",
									font, sideWaysMargin, 0,
									alignment.LEFTALONGRIGHT);
							drawFormattedString("REG.REQ.", font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						if (!(claimStr[ctr].equals("NA") || claimStr[ctr]
								.equals("0"))) {
							drawFormattedString(claimStr[ctr] + "Panel (s)",
									font, sideWaysMargin, 0,
									alignment.LEFTALONGRIGHT);
							drawFormattedString("CLAIMED", font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						if (!(pndPayStr[ctr].equals("NA") || pndPayStr[ctr]
								.equals("0"))) {
							drawFormattedString(pndPayStr[ctr] + "Panel (s)",
									font, sideWaysMargin, 0,
									alignment.LEFTALONGRIGHT);
							drawFormattedString("IN PROCESS", font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						if (!(outVerifyStr[ctr].equals("NA") || outVerifyStr[ctr]
								.equals("0"))) {
							drawFormattedString(
									outVerifyStr[ctr] + "Panel (s)", font,
									sideWaysMargin, 0, alignment.LEFTALONGRIGHT);
							drawFormattedString("OUT OF VERIFY", font,
									sideWaysMargin, 0, alignment.RIGHTMARGIN);
						}
						int regCount = 0;
						if (!registerStr[ctr].equals("NA")) {
							regCount = Integer.parseInt(registerStr[ctr]);
						}
						totRegister = totRegister + regCount;
					}
					str = "----------------------------------------------------";
					drawFormattedString(str, font, 0, -5, alignment.CENTERED);
					double outVerifyCount = 0;
					if (!drawAmtStr[ctr].equals("NA")) {
						outVerifyCount = Double.parseDouble(drawAmtStr[ctr]);
					}
					totTktAmt = totTktAmt + outVerifyCount;
				}
			} else if (status.equals("ERROR")) {
				drawFormattedString("ERROR! Please Try Again..", font, 0, 0,
						alignment.CENTERED);
			}

			drawFormattedString("Total Pay" + "(" + currSymbol + ")", font,
					sideWaysMargin, 0, alignment.LEFTALONGRIGHT);
			drawFormattedString(totTktAmt + "", font, sideWaysMargin, 0,
					alignment.RIGHTMARGIN);
			abc = totTktAmt;
			// System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+abc);

			if (totRegister != 0) {
				drawFormattedString(totRegister + "Panel (s)", font,
						sideWaysMargin, 0, alignment.LEFTALONGRIGHT);
				drawFormattedString("REG. REQ.", font, sideWaysMargin, 0,
						alignment.RIGHTMARGIN);
			}
			
			drawFormattedString(retailerName.toUpperCase(), font, 0, 0,
					alignment.CENTERED);
			
			drawFormattedString("**********************************", font, 0,
					0, alignment.CENTERED);

			if (isReprint.equals("true")) {
				prepareTicket();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void prepareCancel(){
		System.out.println("in perpareCancel() method...");
		try{
			Font font = new Font("Arial", Font.PLAIN, 10);
			
			String mode = dataMap.get("mode");
			String tktStatus = dataMap.get("tktStatus");
			String orgName = dataMap.get("orgName");
			String currSymbol = dataMap.get("currSymbol");
			String gameName = dataMap.get("gameName");
			String gameDispName = dataMap.get("gameDispName");
			String tktNo = dataMap.get("tktNo");
			String refundAmt = dataMap.get("refundAmt");
			
			drawFormattedString("*********************************************", font, 0, 0, alignment.CENTERED);
			
			if(orgName != null && gameDispName != null){
				Map<TextAttribute, Object> textAttributes = new HashMap<TextAttribute, Object>();
				
				textAttributes.put(TextAttribute.WEIGHT, 300f);
				textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
				textAttributes.put(TextAttribute.SIZE, 24f);
				textAttributes.put(TextAttribute.WIDTH,
						TextAttribute.WIDTH_SEMI_CONDENSED);
				textAttributes.put(TextAttribute.JUSTIFICATION, 0.5f);
				font = this.getFont().deriveFont(textAttributes);
				
				drawFormattedString(orgName, font, 0, 5, alignment.CENTERED);
				textAttributes.clear();
				
				textAttributes.put(TextAttribute.WEIGHT, 300f);
				textAttributes.put(TextAttribute.FAMILY, "Letter Gothic Std");
				textAttributes.put(TextAttribute.SIZE, 15f);
				font = this.getFont().deriveFont(textAttributes);
				
				drawFormattedString(gameDispName, font, 0, -15, alignment.CENTERED);
				textAttributes.clear();
				
				font = new Font("Arial", Font.PLAIN, 10);
				g.setFont(font);
				
				String[] currentTimeArr = new Timestamp(new Date().getTime()).toString().split(" ");

				String[] strArr = currentTimeArr[0].split("-");
				
				StringBuilder sb = new StringBuilder("");
				for(int i=strArr.length-1; i>=0; i--){
					sb.append(strArr[i]);
					if(i!=0)
						sb.append("-");
				}
					
				drawFormattedString(sb.toString(), font, 15, -5,
						alignment.LEFTALONGRIGHT);
				drawFormattedString(currentTimeArr[1].substring(0, currentTimeArr[1].indexOf('.')), font, 15, -5,
						alignment.RIGHTMARGIN);

				drawFormattedString("----------------------------------------------------", font, 0, -5, alignment.CENTERED);
				
			}
			
			font = new Font("Arial", Font.PLAIN, 10);
			g.setFont(font);
			
			
			
			drawFormattedString("TicketNo: " + tktNo, font, 0, 0, alignment.CENTERED);
			
			if("Cancelled".equalsIgnoreCase(tktStatus)){
				drawFormattedString("Ticket Has Been Cancelled.", font, 0, 0, alignment.CENTERED);
			}
			
			if(currSymbol != null){
				drawFormattedString("Refund Amount:  " + currSymbol + " " + refundAmt + "/-", font, 0, 0, alignment.CENTERED);
			}else{
				drawFormattedString("Refund Amount:  " + refundAmt + "/-", font, 0, 0, alignment.CENTERED);
			}
			
			drawFormattedString("*********************************************", font, 0, 0, alignment.CENTERED);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void drawFormattedString(String str, Font f, int sideWaysMargin,
			int relativeHeight, Alignment alignment) {
		g.setFont(f);
		fm = g.getFontMetrics();
		rect = fm.getStringBounds(str, g);
		switch (alignment) {
		case CENTERED:
			g.drawString(str, (int) (appletWidth - rect.getWidth()) / 2,
					prevyAxis + height + relativeHeight);
			break;
		case LEFTALONGRIGHT:
		case LEFTMARGIN:
			g.drawString(str, sideWaysMargin, prevyAxis + height
					+ relativeHeight);
			break;
		case RIGHTMARGIN:
			g.drawString(str,
					(int) (appletWidth - rect.getWidth() - sideWaysMargin),
					prevyAxis + height + relativeHeight);
		}
		if (Alignment.valueOf(alignment.toString()) != Alignment.LEFTALONGRIGHT) {
			prevyAxis = prevyAxis + height;
			// we add relativeHeight which can be negative or positive
			height = (int) fm.getLineMetrics(str, g).getHeight()
					+ relativeHeight;
			//System.out.println("HEIGHT ****** = "
					//+ (int) fm.getLineMetrics(str, g).getHeight());
		} else {
			prevyAxis = prevyAxis + height;
			height = 0;
		}
	}

	private String[] getWinningArray(GameNameEnum gameNameEnum) {
		switch (gameNameEnum) {
		case Fortune:
			return fortuneData;
		case Card12:
			return card12Data;
		case Card16:
			return card16Data;
		case Zerotonine:
			return zeroToNineData;
		}
		return null;
	}

	// Method to print the sketch
	public int print(Graphics g, // Graphics context for printing
			PageFormat pageFormat, // The page format
			int pageIndex) // Index number of current page
			throws PrinterException {
		if (pageIndex > 0) {
			return NO_SUCH_PAGE;
		}
		Graphics2D g2D = (Graphics2D) g;

		Rectangle rect = new Rectangle(this.getBounds());
		// Calculate the scale to fit sketch to page
		double scaleX = pageFormat.getImageableWidth() / rect.width;
		double scaleY = pageFormat.getImageableHeight() / Integer.parseInt(dataMap.get("ctr"));
		// Get minimum scale factor
		System.out.println(dataMap.get("ctr")+"******"+pageFormat.getImageableX()+"**********"+pageFormat.getImageableY()+"******************"+pageFormat.getImageableHeight());
		double scale = Math.min(scaleX, scaleY);
		// Move origin to page printing area corner
		g2D.translate(pageFormat.getImageableX(), pageFormat.getImageableY());
		g2D.scale(scale, scale); // Apply scale factor
		g2D.translate(-rect.x, -rect.y); // Move origin to rect top left

		paint(g2D); // Draw the sketch
		return PAGE_EXISTS;
	}

	BufferedImage img;
	Applet app;

	public static void main(String[] args) {

	}
}
