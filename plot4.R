data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE);
data$Date <- as.Date(data$Date, "%d/%m/%Y");
date1 <- as.Date("2007-02-01", "%Y-%m-%d");
date2 <- as.Date("2007-02-02", "%Y-%m-%d");
data <- subset(data, data$Date == date1 | data$Date == date2);
#Params
Sys.setlocale("LC_TIME", "English");
png(file="plot4.png",width=480,height=480);
par(mfrow = c(2,2));
#All plots - X
data_plot_x <- paste(data$Date, data$Time);
data_plot_x <- as.POSIXlt(as.character(data_plot2_x), format = "%Y-%m-%d %H:%M:%S");
#Plot 1
data_plot1_y <- data$Global_active_power;
data_plot1_y <- subset(data_plot1_y, data_plot1_y != "?");
data_plot1_y <- factor(data_plot1_y);
data_plot1_y <- as.numeric(as.character(data_plot1_y));
plot(data_plot_x, data_plot1_y, type="l", ylab="Global Active Power (kilowatts)", xlab="");
#Plot 2
data_plot2_y <- data$Voltage;
data_plot2_y <- subset(data_plot2_y, data_plot2_y != "?");
data_plot2_y <- factor(data_plot2_y);
data_plot2_y <- as.numeric(as.character(data_plot2_y));
plot(data_plot_x, data_plot2_y, type="l", ylab="Voltage", xlab="datetime");
#Plot 3
#Sub_metering_1
data_plot3_y1 <- data$Sub_metering_1;
data_plot3_y1 <- subset(data_plot3_y1, data_plot3_y1 != "?");
data_plot3_y1 <- factor(data_plot3_y1);
data_plot3_y1 <- as.numeric(as.character(data_plot3_y1));
#Sub_metering_2
data_plot3_y2 <- data$Sub_metering_2;
data_plot3_y2 <- subset(data_plot3_y2, data_plot3_y2 != "?");
data_plot3_y2 <- factor(data_plot3_y2);
data_plot3_y2 <- as.numeric(as.character(data_plot3_y2));
#Sub_metering_3
data_plot3_y3 <- data$Sub_metering_3;
data_plot3_y3 <- subset(data_plot3_y3, data_plot3_y3 != "?");
data_plot3_y3 <- factor(data_plot3_y3);
data_plot3_y3 <- as.numeric(as.character(data_plot3_y3));
plot(data_plot_x, data_plot3_y1, type="l", ylab="Energy sub metering", xlab="");
lines(data_plot_x, data_plot3_y2, col=rgb(255, 37, 0, maxColorValue=255));
lines(data_plot_x, data_plot3_y3, col=rgb(4, 51, 255, maxColorValue=255));
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(rgb(0, 0, 0, maxColorValue=255), rgb(255, 37, 0, maxColorValue=255), rgb(4, 51, 255, maxColorValue=255)), lty=c(1,1,1));
#Plot 4
data_plot4_y <- data$Global_reactive_power;
data_plot4_y <- subset(data_plot4_y, data_plot4_y != "?");
data_plot4_y <- factor(data_plot4_y);
data_plot4_y <- as.numeric(as.character(data_plot4_y));
plot(data_plot_x, data_plot4_y, type="l", ylab="Global_reactive_power", xlab="datetime");
dev.off();