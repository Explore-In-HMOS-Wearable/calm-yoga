import { calendarManager } from '@kit.CalendarKit';

export class CalendarService {
  private static instance: CalendarService;
  private calendar: calendarManager.Calendar | null = null;

  private constructor() {
  }

  public static getInstance(): CalendarService {
    if (!CalendarService.instance) {
      CalendarService.instance = new CalendarService();
    }
    return CalendarService.instance;
  }

  private async getCalendar(): Promise<calendarManager.Calendar | null> {
    if (this.calendar) {
      return this.calendar;
    }

    const mgr: calendarManager.CalendarManager | undefined = AppStorage.get('calendarMgr');

    if (!mgr) {
      return null;
    }

    try {
      this.calendar = await mgr.getCalendar();
      return this.calendar;
    } catch (err) {
      return null;
    }
  }

  async getWeeklyStreak(): Promise<number> {
    const cal = await this.getCalendar();
    if (!cal) {
      return 0;
    }

    const now = Date.now();
    const sevenDaysAgo = now - (7 * 24 * 60 * 60 * 1000);
    const filter = calendarManager.EventFilter.filterByTime(sevenDaysAgo, now);

    try {
      const events = await cal.getEvents(filter);
      const activeDays = new Set<string>();
      const dateTool = new Date();

      events.forEach(ev => {
        if (ev.title?.includes('Yoga') && ev.startTime) {
          dateTool.setTime(ev.startTime);
          activeDays.add(dateTool.toDateString());
        }
      });

      return activeDays.size;
    } catch (err) {
      return 0;
    }
  }

  public async addSession(title: string, durationMinutes: number = 30): Promise<number | null> {
    const calendar = await this.getCalendar();
    if (!calendar) {
      return null;
    }

    const start = Date.now();
    const end = start + (durationMinutes * 60 * 1000);

    const event: calendarManager.Event = {
      title: `Yoga: ${title}`,
      startTime: start,
      endTime: end,
      type: calendarManager.EventType.NORMAL,
      reminderTime: [15],
      service: {
        type: calendarManager.ServiceType.SPORTS_EXERCISE,
        uri: 'calmyoga://start_flow',
        description: 'Start Exercise'
      }
    };

    try {
      return await calendar.addEvent(event);
    } catch (err) {
      return null;
    }
  }

  async getSessions(): Promise<calendarManager.Event[]> {
    const cal = await this.getCalendar();
    if (!cal) {
      return [];
    }
    try {
      const filter = calendarManager.EventFilter.filterByTitle('Yoga');
      return await cal.getEvents(filter);
    } catch (err) {
      return [];
    }
  }
}