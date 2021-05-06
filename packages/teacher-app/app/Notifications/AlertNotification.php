<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
/* use Notification; */
class AlertNotification extends Notification
{
    use Queueable;
    private $homwWorkData;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($homwWorkData)
    {
        //
      
        $this->homwWorkData= $homwWorkData;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
       
        return (new MailMessage)                    
            ->greeting($this->homwWorkData['name'])
            ->line($this->homwWorkData['body'])
            ->action($this->homwWorkData['text'], $this->homwWorkData['url'])
            ->line($this->homwWorkData['thanks']);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'homework_id' => $this->homwWorkData['homework_id']
        ];
    }
}